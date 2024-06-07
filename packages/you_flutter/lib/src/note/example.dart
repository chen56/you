import 'package:flutter/material.dart';
import 'package:you_flutter/asset.dart';
import 'package:you_flutter/router.dart';
import 'package:you_flutter/src/note/source_code.dart';
import 'package:path/path.dart' as path;

class FlutterExample extends StatelessWidget {
  final String title;
  final Widget child;
  final WidgetBuilder? builder;
  final double? width;
  final double? height;
  final BoxConstraints? constraints;
  final CellCaller caller;
  final Asset? source;

  FlutterExample({
    super.key,
    required this.title,
    this.width,
    this.height,
    this.constraints,
    this.builder,
    required this.child,
    this.source,
  }) : caller = CellCaller.track(); //

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    var textStyle = Theme.of(context).textTheme;
    var route = YouRouter.of(context);
    return Container(
      decoration: BoxDecoration(color: colors.surfaceContainerLow, borderRadius: BorderRadius.circular(8.0), border: Border.all(width: 1, color: colors.outlineVariant)),
      child: Column(
        children: [
          Container(
            height: 36,
            color: colors.surfaceContainerHigh,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(width: 10),
                Text(title, style: textStyle.titleMedium),
                const Spacer(),
                IconButton(
                    icon: const Icon(size: 24, Icons.code),
                    tooltip: "open source",
                    onPressed: () async {
                      var callerParsed = await caller.tryParse(route.uri);

                      if (context.mounted) {
                        var s = ScaffoldMessenger.of(context);
                        String assetPath = path.normalize("lib/routes/${route.uri.path}/page.dart");
                        String code = await DefaultAssetBundle.of(context).loadString(assetPath);
                        s.showSnackBar(SnackBar(content: Text("caller; ${callerParsed.callerFrame}: code:$code")));
                      }
                    }),
                IconButton(icon: const Icon(size: 24, Icons.fullscreen), onPressed: () {}),
              ],
            ),
          ),
          Container(
            width: width,
            height: height,
            constraints: constraints,
            // color: colors.surface,

            padding: const EdgeInsets.all(12),
            child: child,
          ),
        ],
      ),
    );
  }
}
