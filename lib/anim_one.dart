import 'package:flutter/material.dart';

class FirstAnim extends StatefulWidget {
  @override
  _FirstAnimState createState() => _FirstAnimState();
}

class _FirstAnimState extends State<FirstAnim>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        switch (status) {
          case AnimationStatus.completed:
            print("completed");
            controller.reverse();
            break;

          case AnimationStatus.forward:
            print("forward");
            break;
          case AnimationStatus.reverse:
            print("reverse");
            break;
          case AnimationStatus.dismissed:
            controller.forward();
            print("dismissed");
            break;
        }
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Container(
            width: animation.value,
            height: animation.value,
            child: FlutterLogo(),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.play_circle_outline),
            onPressed: () {
              controller.forward();
            }),
      ),
    );
  }
}
