import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

main() {
  runApp(const MyHomepage());
}

class MyHomepage extends StatelessWidget {
  const MyHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.start, children: const [
        Text(
            "datadatadatadatadatadatadatadatassssssssssssssssdatadatadatadatadatadatadatadatassssssssssssssssdatadatadatadatadatadatadatadatassssssssssssssss"),
        Text(
            "datadatadatadatadatadatadatadatassssssssssssssssdatadatadatadatadatadatadatadatassssssssssssssssdatadatadatadatadatadatadatadatassssssssssssssss"),
      ]),
    );
  }
}
