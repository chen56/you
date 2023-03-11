import 'package:flutter/material.dart';
import 'package:flutter_note/params/param.dart';

void main() {
  runApp(const SliderApp());
}

final ParamNode params = ParamNode();
final insert = params.insert;
final insert_ = params.insert_;

class SliderApp extends StatefulWidget {
  const SliderApp({super.key});

  @override
  State<SliderApp> createState() => _SliderAppState();
}

class _SliderAppState extends State<SliderApp> {
  double _value = 10;

  @override
  Widget build(BuildContext context) {
    var body = Row(
      children: [
        Slider(
          min: 0,
          max: 100,
          value: _value,
          label: "$_value",
          onChanged: (double newValue) {
            setState(() {
              _value = newValue;
            });
          },
        ),
        Icon(Icons.accessibility, size: _value)
      ],
    );
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          sliderTheme: const SliderThemeData(showValueIndicator: ShowValueIndicator.always),
          useMaterial3: true,
        ),
        home: Scaffold(body: body));
  }
}
