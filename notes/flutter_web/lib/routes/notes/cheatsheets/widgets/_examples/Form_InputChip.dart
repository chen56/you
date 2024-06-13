import 'package:flutter/material.dart';
import 'package:you_flutter/state.dart';

main() {
  runApp(MaterialApp(home: Scaffold(body: Form_InputChip())));
}

// ignore: camel_case_types
class Form_InputChip extends StatefulWidget {
  Form_InputChip({super.key});

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<Form_InputChip> {
  final TextEditingController controller = TextEditingController();
  final List<String> tags = <String>[].signal();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Watch(
      watchListenable: controller,
      builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.add),
                hintText: 'Write a tag, enter to add',
              ),
              onSubmitted: (_) {
                if (controller.text.isNotEmpty) {
                  if (!tags.contains(controller.text)) {
                    tags.add(controller.text);
                  }
                  controller.clear(); // 清空TextField
                }
              },
            ),
            Wrap(
              spacing: 8.0,
              children: tags.map((tag) {
                return InputChip(
                  avatar: const Icon(Icons.tag),
                  label: Text(tag),
                  onDeleted: () => tags.remove(tag),
                  deleteIcon: const Icon(Icons.cancel),
                );
              }).toList(),
            )
          ],
        );
      },
    );
  }
}
