import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

main() {
  runApp(const MyHomepage());
}

class MyHomepage extends StatelessWidget {
  const MyHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Directionality(
      textDirection: TextDirection.ltr,
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Text(
            "datadatadatadatadatadatadatadatassssssssssssssssdatadatadatadatadatadatadatadatassssssssssssssssdatadatadatadatadatadatadatadatassssssssssssssss"),
        Text(
            "datadatadatadatadatadatadatadatassssssssssssssssdatadatadatadatadatadatadatadatassssssssssssssssdatadatadatadatadatadatadatadatassssssssssssssss"),
      ]),
    );
  }
}
