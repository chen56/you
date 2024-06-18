import 'package:flutter/material.dart';
import 'package:you_flutter/state.dart';

main() {
  runApp(MaterialApp(home: Scaffold(body: Form_Slider())));
}

// ignore: camel_case_types
class Form_Slider extends StatelessWidget {
  Form_Slider({super.key});

  final Value<double> slider1 = 0.0.signal();
  final Value<double> slider2 = 0.0.signal();

  @override
  Widget build(BuildContext context) {
    return Watch(
      builder: (context) {
        return Column(
          children: <Widget>[
            Slider(
              max: 100,
              value: slider1.value,
              onChanged: (value) {
                slider1.value = value;
              },
            ),
            Text(slider1.value.toStringAsFixed(2)),
            Slider(
              max: 100,
              divisions: 5,
              secondaryTrackValue: 42,
              value: slider2.value,
              label: slider2.value.toString(),
              onChanged: (value) {
                slider2.value = value;
              },
            ),
            Text("${slider2.value}"),
          ],
        );
      },
    );
  }
}
