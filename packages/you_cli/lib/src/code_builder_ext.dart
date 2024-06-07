import 'package:code_builder/code_builder.dart';
import 'package:path/path.dart' as path;
import 'package:you_cli/src/urils.dart';

/// 自定义Allocator: 更清晰干净的前缀
class CleanPrefixedAllocator implements Allocator {
  final _importWithSymbols = <String, Set<String>>{};
  final _importsUrlAndAs = <String, String?>{};
  final _asKeys = <String, int>{};

  @override
  String allocate(Reference reference) {
    String symbol = reference.symbol!;
    String? url = reference.url;

    if (url == null) {
      return symbol;
    }

    Set<String>? symbols = _importWithSymbols[url];

    if (symbols == null) {
      // init
      _importWithSymbols[url] = symbols = {};
    }

    for (var MapEntry(key: otherUrl, value: symbols) in _importWithSymbols.entries) {
      if (otherUrl == url) {
        continue;
      }
      if (symbols.contains(symbol)) {
        // 冲突
        String as = _importsUrlAndAs.putIfAbsent(url, () {
          Uri uri = Uri.parse(url);
          String filename = path.basename(uri.path).replaceFirst(".dart", "");
          var dirname = path.basename(path.dirname(uri.path));
          var as = paths.pathPartToVar("_${dirname}_$filename");
          int times = _asKeys.putIfAbsent(as, () => 0);
          if (times == 0) {
            _asKeys[as] = ++times;
            return as;
          } else {
            _asKeys[as] = ++times;
            return "$as$times";
          }
        })!;
        return "$as.$symbol";
      }
    }

    // 未发现冲突
    symbols.add(symbol);
    _importsUrlAndAs.putIfAbsent(url, () => null);
    return symbol;
  }

  @override
  Iterable<Directive> get imports => _importsUrlAndAs.keys.map(
        (u) => Directive.import(u, as: _importsUrlAndAs[u]),
      );
}

/// copy from code_builder source code
/// 【you_cli】update code:
///    - visitInvokeExpression : only remove last arguments: ','
///    - visitClass : only remove field newline  ','
///    - visitMixin : only remove field newline  ','
///    - visitLiteralListExpression: only add ',' at last
class DartEmitterForCli extends DartEmitter {
  bool _withInConstExpression = false;

  DartEmitterForCli({Allocator? allocator, super.orderDirectives})
      : super(
          allocator: allocator ?? Allocator.simplePrefixing(),
          useNullSafetySyntax: true,
        );

  @override
  StringSink visitInvokeExpression(InvokeExpression expression, [StringSink? output]) {
    final out = output ??= StringBuffer();
    return _writeConstExpression(out, expression.isConst, () {
      expression.target.accept(this, out);
      if (expression.name != null) {
        out
          ..write('.')
          ..write(expression.name);
      }
      if (expression.typeArguments.isNotEmpty) {
        out.write('<');
        visitAll<Reference>(expression.typeArguments, out, (type) {
          type.accept(this, out);
        });
        out.write('>');
      }
      out.write('(');
      visitAll<Spec>(expression.positionalArguments, out, (spec) {
        spec.accept(this, out);
      });
      if (expression.positionalArguments.isNotEmpty && expression.namedArguments.isNotEmpty) {
        out.write(', ');
      }
      visitAll<String>(expression.namedArguments.keys, out, (name) {
        out
          ..write(name)
          ..write(': ');
        expression.namedArguments[name]!.accept(this, out);
      });
      final argumentCount = expression.positionalArguments.length + expression.namedArguments.length;
      if (argumentCount > 1) {
        // ***【you_cli】: only change this code:***
        // out.write(', ');
      }
      return out..write(')');
    });
  }

  @override
  StringSink visitLiteralListExpression(
    LiteralListExpression expression, [
    StringSink? output,
  ]) {
    final out = output ??= StringBuffer();

    return _writeConstExpression(output, expression.isConst, () {
      if (expression.type != null) {
        out.write('<');
        expression.type!.accept(this, output);
        out.write('>');
      }
      out.write('[');
      visitAll<Object?>(expression.values, out, (value) {
        _acceptLiteral(value, out);
      });
      // ***【you_cli】: only change this code:***
      // old: if (expression.values.length > 1) {
      /*new*/
      if (expression.values.isNotEmpty) {
        out.write(', ');
      }
      return out..write(']');
    });
  }

  void _acceptLiteral(Object? literalOrSpec, StringSink output) {
    if (literalOrSpec is Spec) {
      literalOrSpec.accept(this, output);
      return;
    }
    literal(literalOrSpec).accept(this, output);
  }

  @override
  StringSink visitClass(Class spec, [StringSink? output]) {
    final out = output ??= StringBuffer();
    spec.docs.forEach(out.writeln);
    for (var a in spec.annotations) {
      visitAnnotation(a, out);
    }

    void writeModifier() {
      if (spec.modifier != null) {
        out.write('${spec.modifier!.name} ');
      }
    }

    if (spec.sealed) {
      out.write('sealed ');
    } else {
      if (spec.abstract) {
        out.write('abstract ');
      }
      writeModifier();
      if (spec.mixin) {
        out.write('mixin ');
      }
    }
    out.write('class ${spec.name}');
    visitTypeParameters(spec.types.map((r) => r.type), out);
    if (spec.extend != null) {
      out.write(' extends ');
      spec.extend!.type.accept(this, out);
    }
    if (spec.mixins.isNotEmpty) {
      out
        ..write(' with ')
        ..writeAll(spec.mixins.map<StringSink>((m) => m.type.accept(this)), ',');
    }
    if (spec.implements.isNotEmpty) {
      out
        ..write(' implements ')
        ..writeAll(spec.implements.map<StringSink>((m) => m.type.accept(this)), ',');
    }
    out.write(' {');
    for (var c in spec.constructors) {
      visitConstructor(c, spec.name, out);
      out.writeln();
    }
    for (var f in spec.fields) {
      visitField(f, out);
      // ***【you_cli】: only change this code:***
      // out.writeln();
    }
    for (var m in spec.methods) {
      visitMethod(m, out);
      if (_isLambdaMethod(m)) {
        out.writeln(';');
      }
      out.writeln();
    }
    out.writeln(' }');
    return out;
  }

  @override
  StringSink visitMixin(Mixin spec, [StringSink? output]) {
    final out = output ??= StringBuffer();
    spec.docs.forEach(out.writeln);
    for (var a in spec.annotations) {
      visitAnnotation(a, out);
    }

    if (spec.base) {
      out.write('base ');
    }
    out.write('mixin ${spec.name}');
    visitTypeParameters(spec.types.map((r) => r.type), out);
    if (spec.on != null) {
      out.write(' on ');
      spec.on!.type.accept(this, out);
    }
    if (spec.implements.isNotEmpty) {
      out
        ..write(' implements ')
        ..writeAll(spec.implements.map<StringSink>((m) => m.type.accept(this)), ',');
    }
    out.write('  {');
    for (var f in spec.fields) {
      visitField(f, out);
      // ***【you_cli】: only change this code:***
      // out.writeln();
    }
    for (var m in spec.methods) {
      visitMethod(m, out);
      if (_isLambdaMethod(m)) {
        out.write(';');
      }
      out.writeln();
    }
    out.write('  }');
    return out;
  }

  static bool _isLambdaBody(Code? code) => code is ToCodeExpression && !code.isStatement;

  /// Whether the provided [method] is considered a lambda method.
  static bool _isLambdaMethod(Method method) => method.lambda ?? _isLambdaBody(method.body);

  /// Executes [visit] within a context which may alter the output if [isConst]
  /// is `true`.
  ///
  /// This allows constant expressions to omit the `const` keyword if they
  /// are already within a constant expression.
  @override
  void startConstCode(
    bool isConst,
    Null Function() visit,
  ) {
    final previousConstContext = _withInConstExpression;
    if (isConst) {
      _withInConstExpression = true;
    }

    visit();
    _withInConstExpression = previousConstContext;
  }

  /// Similar to [startConstCode], but handles writing `"const "` if [isConst]
  /// is `true` and the invocation is not nested under other invocations where
  /// [isConst] is true.
  StringSink _writeConstExpression(
    StringSink sink,
    bool isConst,
    StringSink Function() visitExpression,
  ) {
    final previousConstContext = _withInConstExpression;
    if (isConst) {
      if (!_withInConstExpression) {
        sink.write('const ');
      }
      _withInConstExpression = true;
    }

    final returnedSink = visitExpression();
    assert(identical(returnedSink, sink));
    _withInConstExpression = previousConstContext;
    return sink;
  }
}

/// Helper method improving on [StringSink.writeAll].
///
/// For every `Spec` in [elements], executing [visit].
///
/// If [elements] is at least 2 elements, inserts [separator] delimiting them.
StringSink visitAll<T>(
  Iterable<T> elements,
  StringSink output,
  void Function(T) visit, [
  String separator = ', ',
]) {
  // Basically, this whole method is an improvement on
  //   output.writeAll(specs.map((s) => s.accept(visitor));
  //
  // ... which would allocate more StringBuffer(s) for a one-time use.
  if (elements.isEmpty) {
    return output;
  }
  final iterator = elements.iterator..moveNext();
  visit(iterator.current);
  while (iterator.moveNext()) {
    output.write(separator);
    visit(iterator.current);
  }
  return output;
}
