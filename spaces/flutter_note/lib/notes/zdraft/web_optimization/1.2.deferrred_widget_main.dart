import 'package:flutter/material.dart';
import 'package:flutter_note/notes/zdraft/web_optimization/1,deferrred_widget.dart'
    deferred as box;

/// ref: https://docs.flutter.dev/perf/deferred-components
main() {
  registerNote("DeferredBox", () {
    // var f = Future.delayed(const Duration(seconds: 3));
    var f = Future.delayed(const Duration(seconds: 3)).then(
        (value) => throw Exception("exception :$value"),
        onError: (e, StackTrace? stackTrace) {});
    return f.then((value) => box
            .loadLibrary()
            .then((_) => Future(() => box.DeferredBox()),
                onError: (e, StackTrace? stackTrace) {
          print("ppp $e");
          return Text("future error:$e : $stackTrace");
        }));
  });
  runApp(const MaterialApp(home: Scaffold(body: SomeWidget())));
}

Map<String, Future<Widget> Function()> deferredMap = {};
void registerNote(String name, Future<Widget> Function() deferredObject) {
  deferredMap[name] = deferredObject;
}

class SomeWidget extends StatefulWidget {
  const SomeWidget({super.key});

  @override
  State<SomeWidget> createState() => _SomeWidgetState();
}

class _SomeWidgetState extends State<SomeWidget> {
  // final Future<Widget> _libraryFuture = deferredMap["DeferredBox"]!();

  @override
  Widget build(BuildContext context) {
    // return Text("ss");
    return FutureBuilder(
      future: deferredMap["DeferredBox"]!(),
      builder: (context, snapshot) {
        debugPrint("FutureBuilder.build - $snapshot");
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text(
                'snapshot.hasError==true: error:${snapshot.error} - data:${snapshot.data}');
          }
          return snapshot.data!;
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
