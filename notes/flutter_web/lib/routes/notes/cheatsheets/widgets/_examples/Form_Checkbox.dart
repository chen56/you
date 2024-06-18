import 'package:flutter/material.dart';
import 'package:you_flutter/state.dart';

main() {
  runApp(const MaterialApp(home: Scaffold(body: Form_Checkbox())));
}

// ignore: camel_case_types
class Form_Checkbox extends StatefulWidget {
  const Form_Checkbox({super.key});

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<Form_Checkbox> {
  final Value<bool?> checkbox1 = (null as bool?).signal();
  final Value<bool> checkbox2 = false.signal();

  @override
  Widget build(BuildContext context) {
    return Watch(
      builder: (context) {
        return Column(
          children: <Widget>[
            Row(
              children: [
                const Text('tristate: true'),
                Checkbox(tristate: true, checkColor: Colors.white, value: checkbox1.value, onChanged: (value) => checkbox1.value = value),
              ],
            ),
            Row(
              children: [
                const Text('tristate: false'),
                Checkbox(tristate: false, checkColor: Colors.white, value: checkbox2.value, onChanged: (value) => checkbox2.value = value!),
              ],
            ),
          ],
        );
      },
    );
  }
}
