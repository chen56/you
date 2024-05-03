import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:you_flutter/router.dart';
import 'package:you_flutter/note.dart';

/// [NoteLayoutBuilder]
ToResult layout(BuildContext context, ToResult child) {
  // ignore: unnecessary_type_check
  assert(layout is PageLayoutBuilder);
  return child.warp(RootLayout(child: child));
}

class RootLayout extends StatelessWidget {
  final ToResult child;

  const RootLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final route = YouRouter.of(context);


    return Scaffold(
      primary: true,
      // content...
      appBar: AppBar(toolbarHeight: 38, title: Text("location: ${route.uri}"), actions: [
        IconButton(iconSize: 24, icon: const Icon(Icons.color_lens_outlined), onPressed: () {}),
        IconButton(iconSize: 24, icon: const Icon(Icons.settings), onPressed: () {}),
      ]),
      body: SafeArea(
        child: SelectionArea(
          child: child.widget,
        ),
      ),
    );
  }
}
