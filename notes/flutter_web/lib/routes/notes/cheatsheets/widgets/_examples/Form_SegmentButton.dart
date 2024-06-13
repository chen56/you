import 'package:flutter/material.dart';
import 'package:you_flutter/state.dart';

main() {
  runApp(const MaterialApp(home: Scaffold(body: Form_SegmentButton())));
}

// ignore: camel_case_types
class Form_SegmentButton extends StatefulWidget {
  const Form_SegmentButton({super.key});

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<Form_SegmentButton> {
  final Value<ThemeMode> themeMode = ThemeMode.system.signal();
  final Set<TargetPlatform> targetPlatforms = <TargetPlatform>{TargetPlatform.macOS, TargetPlatform.linux}.signal();

  @override
  Widget build(BuildContext context) {
    return Watch(builder: (context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SegmentedButton<ThemeMode>(
            multiSelectionEnabled: false,
            segments: const <ButtonSegment<ThemeMode>>[
              ButtonSegment<ThemeMode>(value: ThemeMode.light, label: Text('Light'), icon: Icon(Icons.sunny)),
              ButtonSegment<ThemeMode>(value: ThemeMode.system, label: Text('System'), icon: Icon(Icons.brightness_auto)),
              ButtonSegment<ThemeMode>(value: ThemeMode.dark, label: Text('Dark'), icon: Icon(Icons.dark_mode)),
            ],
            selected: <ThemeMode>{themeMode.value},
            onSelectionChanged: (newSelection) {
              themeMode.value = newSelection.first;
            },
          ),
          const SizedBox(height: 10),
          SegmentedButton<TargetPlatform>(
            segments: const <ButtonSegment<TargetPlatform>>[
              ButtonSegment<TargetPlatform>(value: TargetPlatform.android, label: Text('android')),
              ButtonSegment<TargetPlatform>(value: TargetPlatform.fuchsia, label: Text('fuchsia')),
              ButtonSegment<TargetPlatform>(value: TargetPlatform.iOS, label: Text('iOS')),
              ButtonSegment<TargetPlatform>(value: TargetPlatform.linux, label: Text('linux')),
              ButtonSegment<TargetPlatform>(value: TargetPlatform.macOS, label: Text('macOS')),
              ButtonSegment<TargetPlatform>(value: TargetPlatform.windows, label: Text('windows')),
            ],
            selected: targetPlatforms,
            onSelectionChanged: (newSelection) {
              targetPlatforms.clear();
              targetPlatforms.addAll(newSelection);
            },
            multiSelectionEnabled: true,
          ),
        ],
      );
    });
  }
}
