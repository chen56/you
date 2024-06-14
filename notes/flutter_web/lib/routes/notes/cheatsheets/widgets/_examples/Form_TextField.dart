import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:you_flutter/state.dart';

main() {
  runApp(MaterialApp(home: Scaffold(body: Form_TextField())));
}

// ignore: camel_case_types
class Form_TextField extends StatelessWidget {
  Form_TextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Watch(
      builder: (context) {
        return const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              obscureText: true,
              decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Password'),
            ),
            SizedBox(height: 10),
            TextField(
              maxLength: 10,
              maxLengthEnforcement: MaxLengthEnforcement.none,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '手机号/Phone',
                errorText: '手机号不能为空/phone should not empty',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'disable ',
                enabled: false,
              ),
            ),
          ],
        );
      },
    );
  }
}
