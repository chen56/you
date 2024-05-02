import 'package:flutter/material.dart';
import 'package:you_flutter/router.dart';

final class PageLayoutDefault extends StatelessWidget {
  final PageBuilder builder;

  const PageLayoutDefault({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    var pageBody = builder(context);
    return Scaffold(
      body: SafeArea(
        child: SelectionArea(
          child: pageBody,
        ),
      ),
    );
  }
}