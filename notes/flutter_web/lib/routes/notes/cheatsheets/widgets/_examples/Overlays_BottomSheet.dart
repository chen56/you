import 'package:flutter/material.dart';
import 'package:you_flutter/state.dart';

main() {
  runApp(MaterialApp(home: Scaffold(body: Overlays_BottomSheet())));
}

// ignore: camel_case_types
class Overlays_BottomSheet extends StatelessWidget {
  Overlays_BottomSheet({super.key});

  final Value<PersistentBottomSheetController?> bottomSheetController = (null as PersistentBottomSheetController?).signal();

  @override
  Widget build(BuildContext context) {
    final bar = NavigationBar(
      selectedIndex: 0,
      destinations: [
        NavigationDestination(icon: Badge.count(count: 1000, child: const Icon(Icons.mail_outlined)), label: 'Mail'),
        const NavigationDestination(icon: Badge(label: Text('10'), child: Icon(Icons.chat_bubble_outline)), label: 'Chat'),
        const NavigationDestination(icon: Badge(child: Icon(Icons.group_outlined)), label: 'Rooms'),
        NavigationDestination(icon: Badge.count(count: 3, child: const Icon(Icons.videocam_outlined)), label: 'Meet'),
      ],
    );
    return Watch(builder: (context) {
      return Wrap(
        alignment: WrapAlignment.spaceEvenly,
        children: [
          TextButton(
            child: const Text('modal bottom sheet'),
            onPressed: () {
              showModalBottomSheet<void>(showDragHandle: true, context: context, builder: (context) => bar);
            },
          ),
          TextButton(
            child: Text(bottomSheetController.value == null ? 'open bottom sheet' : 'close bottom sheet'),
            onPressed: () {
              if (bottomSheetController.value != null) {
                bottomSheetController.value?.close();
                bottomSheetController.value = null;
                return;
              }
              bottomSheetController.value = showBottomSheet(context: context, builder: (context) => bar);
            },
          ),
        ],
      );
    });
  }
}
