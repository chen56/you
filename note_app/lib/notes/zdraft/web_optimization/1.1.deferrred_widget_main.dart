import 'package:flutter/material.dart';
import 'package:note_app/notes/zdraft/web_optimization/1,deferrred_widget.dart'
    deferred as box;

/// ref: https://docs.flutter.dev/perf/deferred-components
main() {
  runApp(const MaterialApp(home: Scaffold(body: SomeWidget())));
}

Future<Widget> load() {
  var c = box.loadLibrary();
  return c.then((value) => Future(() => box.DeferredBox()), onError: (err) {
    debugPrint("onError???$err");
  });
}

class SomeWidget extends StatefulWidget {
  const SomeWidget({super.key});

  @override
  State<SomeWidget> createState() => _SomeWidgetState();
}

class _SomeWidgetState extends State<SomeWidget> {
  late Future<void> _libraryFuture;

  @override
  void initState() {
    _libraryFuture = box.loadLibrary();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _libraryFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          return box.DeferredBox();
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
