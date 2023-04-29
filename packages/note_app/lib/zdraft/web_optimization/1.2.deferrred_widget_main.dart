import 'package:flutter/material.dart';
import 'package:note_app/zdraft/web_optimization/1,deferrred_widget.dart'
    deferred as box;

/// ref: https://docs.flutter.dev/perf/deferred-components
main() {
  xx("DeferredBox", () {
    return Future.delayed(const Duration(seconds: 1)).then((value) => box
        .loadLibrary()
        .then((_) => Future(() => box.DeferredBox()),
            onError: (e, StackTrace? stackTrace) =>
                Text("future error:$e : $stackTrace")));
  });
  runApp(const MaterialApp(home: Scaffold(body: SomeWidget())));
}

Map<String, Future<Widget> Function()> deferredMap = {};
void xx(String name, Future<Widget> Function() deferredObject) {
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
        debugPrint("FutureBuilder $snapshot");
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          return snapshot.data!;
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
