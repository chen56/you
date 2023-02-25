import 'dart:io';

import 'package:analyzer/dart/analysis/features.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/token.dart';
import 'package:analyzer/dart/ast/visitor.dart';

main() {
  read(File("/usr/local/Cellar/flutter/packages/flutter/lib/src/widgets/container.dart"));
}

class TypeIs<T> {}

isType<T>(Object o, TypeIs<T> type) {
  return o is T;
}

read(File file) {
  ParseStringResult result =
      parseFile(path: file.path, featureSet: FeatureSet.latestLanguageVersion());
  CompilationUnit unit = result.unit;
  unit.visitChildren(X());
  unit.visitChildren(Find());
}

class Find extends RecursiveAstVisitor<void> {
  @override
  void visitClassDeclaration(ClassDeclaration node) {
    StringBuffer sb = StringBuffer();
    ParamVisitor v = ParamVisitor(sb);
    print("----- gen class : ${node.name} : $sb \n");
    // print("----- gen class : ${node.name} : ${node} \n");

    node.accept(v);
  }
}

class X extends GeneralizingAstVisitor {
  @override
  visitNode(AstNode node) {
    if (node is FieldDeclaration) {
      return null;
    }
    if (node is Comment ||
        node is CommentReference ||
        node is Assertion ||
        node is BlockFunctionBody ||
        node is Annotation ||
        node is EmptyFunctionBody ||
        node is ConstructorFieldInitializer) {
      return null;
    }
    String cut(Object? o, int length) {
      if (o == null) return "null";
      String s = o.toString();
      var strLength = s.length;
      return s.length >= length ? s.substring(0, length) : s;
    }

    print(
        "${"  |" * level(node)}${node.runtimeType}[${node.beginToken} .. ${node.endToken}] child:> ${cut(node.childEntities, 30)} -  - ${cut(node.toString(), 30)}   ");
    return super.visitNode(node);
  }

  int level(AstNode node) {
    return node.parent == null ? 0 : level(node.parent!) + 1;
  }
}

/// 参考[ToSourceVisitor]
class ParamVisitor extends SimpleAstVisitor<void> {
  /// The sink to which the source is to be written.
  final StringSink sink;

  ParamVisitor(this.sink);

  @override
  void visitClassDeclaration(covariant ClassDeclaration node) {
    _visitNodeList(node.metadata, separator: ' ', suffix: ' ');
    // _visitToken(node.augmentKeyword, suffix: ' ');
    _visitToken(node.abstractKeyword, suffix: ' ');
    // _visitToken(node.macroKeyword, suffix: ' ');
    _visitToken(node.sealedKeyword, suffix: ' ');
    _visitToken(node.baseKeyword, suffix: ' base');
    _visitToken(node.interfaceKeyword, suffix: ' ');
    _visitToken(node.finalKeyword, suffix: ' ');
    _visitToken(node.mixinKeyword, suffix: ' ');
    sink.write('class ');
    _visitToken(node.name);
    _visitNode(node.typeParameters);
    _visitNode(node.extendsClause, prefix: ' ');
    _visitNode(node.withClause, prefix: ' ');
    _visitNode(node.implementsClause, prefix: ' ');
    sink.write(' {');
    _visitNodeList(node.members, separator: ' ');
    sink.write('}');
  }

  @override
  void visitExtendsClause(ExtendsClause node) {
    sink.write('extends ');
    _visitNode(node.superclass);
  }

  @override
  void visitNamedType(NamedType node) {
    print("visitNamedType ${node.parent}");
    _visitNode(node.name);
    _visitNode(node.typeArguments);
    if (node.question != null) {
      sink.write('?');
    }
  }

  @override
  void visitDeclaredIdentifier(DeclaredIdentifier node) {
    print("visitDeclaredIdentifier ${node}");
    super.visitDeclaredIdentifier(node);
  }

  @override
  void visitImplementsClause(ImplementsClause node) {
    // TODO: implement visitImplementsClause
    super.visitImplementsClause(node);
  }

  @override
  void visitSuperExpression(SuperExpression node) {
    sink.write('super  ${node.superKeyword}');
  }

  @override
  void visitConstructorDeclaration(ConstructorDeclaration node) {
    _visitNodeList(node.metadata, separator: ' ', suffix: ' ');
    _visitToken(node.externalKeyword, suffix: ' ');
    _visitToken(node.constKeyword, suffix: ' ');
    _visitToken(node.factoryKeyword, suffix: ' ');
    _visitNode(node.returnType);
    _visitToken(node.name, prefix: '.');
    _visitNode(node.parameters);
    _visitNodeList(node.initializers, prefix: ' : ', separator: ', ');
    _visitNode(node.redirectedConstructor, prefix: ' = ');
  }

  /// Print the given [node], printing the [prefix] before the node,
  /// and [suffix] after the node, if it is non-`null`.
  void _visitNode(AstNode? node, {String prefix = '', String suffix = ''}) {
    if (node != null) {
      sink.write(prefix);
      node.accept(this);
      sink.write(suffix);
    }
  }

  /// Print a list of [nodes], separated by the given [separator]; if the list
  /// is not empty print [prefix] before the first node, and [suffix] after
  /// the last node.

  void _visitNodeList(List<AstNode> nodes,
      {String prefix = '', String separator = '', String suffix = ''}) {
    var length = nodes.length;
    if (length > 0) {
      sink.write(prefix);
      for (int i = 0; i < length; i++) {
        if (i > 0) {
          sink.write(separator);
        }
        nodes[i].accept(this);
      }
      sink.write(suffix);
    }
  }

  /// Print the given [token].
  void _visitToken(Token? token, {String prefix = '', String suffix = ''}) {
    if (token != null) {
      sink.write(prefix);
      sink.write(token.lexeme);
      sink.write(suffix);
    }
  }
}
