import 'package:flutter/material.dart';

main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: test14Row(context),
    );
  }

  Widget test1defaultConstraints(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Text("LayoutBuilder: $constraints");
    });
  }

  Widget test2fillScreen(BuildContext context) {
    return Center(
      child: Container(width: double.infinity, height: double.infinity, color: Colors.red),
    );
  }

  Widget test3fillScreen(BuildContext context) {
    return Container(width: double.infinity, height: double.infinity, color: Colors.blue);
  }

  Widget test4ContainerInfinity(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.blue,
      child: LayoutBuilder(builder: (context, constraints) {
        return Text("LayoutBuilder: $constraints");
      }),
    );
  }

  Widget test4Container200(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      color: Colors.blue,
      child: LayoutBuilder(builder: (context, constraints) {
        return Text("LayoutBuilder: $constraints");
      }),
    );
  }

  Widget test5ConstrainedBox(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 70,
        minHeight: 70,
        maxWidth: 150,
        maxHeight: 150,
      ),
      child: LayoutBuilder(builder: (context, constraints) {
        return Text("LayoutBuilder: $constraints");
      }),
    );
  }

  Widget test6Center(BuildContext context) {
    return Center(
      child: LayoutBuilder(builder: (context, constraints) {
        return Text("LayoutBuilder: $constraints");
      }),
    );
  }

  Widget test7Center(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: 70,
          minHeight: 70,
          maxWidth: 150,
          maxHeight: 150,
        ),
        child: Container(color: Colors.blue, width: 10, height: 10),
      ),
    );
  }

  Widget test7InnerLarge(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: 70,
          minHeight: 70,
          maxWidth: 150,
          maxHeight: 150,
        ),
        child: Container(
          color: Colors.blue,
          width: 1000,
          height: 1000,
          child: LayoutBuilder(builder: (context, constraints) {
            return Text("LayoutBuilder: $constraints");
          }),
        ),
      ),
    );
  }

  Widget test8InnerLarge(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: 70,
          minHeight: 70,
          maxWidth: 150,
          maxHeight: 150,
        ),
        child: SizedBox(
          width: 1000,
          height: 1000,
          child: LayoutBuilder(builder: (context, constraints) {
            return Text("SizedBox: $constraints");
          }),
        ),
      ),
    );
  }

  Widget test9InnerLarge(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: 70,
          minHeight: 70,
          maxWidth: 250,
          maxHeight: 150,
        ),
        child: Container(color: Colors.amber, width: 100, height: 100),
      ),
    );
  }

  Widget test10UnconstrainedBox(BuildContext context) {
    return UnconstrainedBox(
      child: LayoutBuilder(builder: (context, constraints) {
        return Text("SizedBox: $constraints");
      }),
    );
  }

  // UnconstrainedBox的行为
  Widget test10UnconstrainedBox2(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        color: Colors.amber,
        width: 200,
        height: 50,
        child: LayoutBuilder(builder: (context, constraints) {
          return Text("SizedBox: $constraints");
        }),
      ),
    );
  }

  Widget test10OverflowBox(BuildContext context) {
    return OverflowBox(
      minWidth: 0,
      minHeight: 0,
      maxWidth: double.infinity,
      maxHeight: double.infinity,
      child: LayoutBuilder(builder: (context, constraints) {
        return Text("SizedBox: $constraints");
      }),
    );
  }

  Widget test13FittedBox(BuildContext context) {
    return FittedBox(
      child: LayoutBuilder(builder: (context, constraints) {
        return Text(
            "SizedBoxSizedB oxSizedBoxSizedBoxSi oxSizedBoxSizedBoxSi oxSizedBoxSizedBoxSi zedBoxSizedBoxSizedBoxSizedBoxSizedB oxSizedBoxSizedBoxSizedBoxSizedBoxSize dBoxSizedBoxSizedBo xSizedBoxSizedBoxSizedBoxSizedBoxSizedBox: $constraints");
      }),
    );
  }

  Widget test14Row(BuildContext context) {
    return Row(
      children: [
        Container(color: Colors.amber, child: const Text('HelloHello HelloHello HelloHello HelloHello HelloHello Hello!')),
        Container(
          color: Colors.red,
          child: const OverflowBox(child: Text(' HelloHello HelloHello HelloHello HelloHello Hello!'),),
        ),
      ],
    );
  }
}

