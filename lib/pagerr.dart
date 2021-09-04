import 'package:flutter/material.dart';
import 'package:zurian/pager.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  AnimationController rippleController;
  AnimationController scaleController;

  Animation<double> rippleAnimation;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    rippleController = AnimationController(vsync: this, duration: Duration(seconds: 2));
    scaleController = AnimationController(vsync: this, duration: Duration(seconds: 2))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          scaleController.reverse();
          Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: SecondScreen()));
        }
      });
    rippleAnimation = Tween<double>(begin: 80.0, end: 90.0).animate(rippleController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          rippleController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          rippleController.forward();
        }
      });
    scaleAnimation = Tween<double>(begin: 1.0, end: 30.0).animate(scaleController);

    rippleController.forward();
  }

  @override
  void dispose() {
    rippleController.dispose();
    scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.bottomCenter,
        child: AnimatedBuilder(
          animation: rippleAnimation,
          builder: (context, child) => Container(
            width: rippleAnimation.value,
            height: rippleAnimation.value,
            child: Container(
              decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xFF7B8794).withOpacity(0.4)),
              child: InkWell(
                onTap: () {
                  scaleController.forward();
                },
                child: AnimatedBuilder(
                    animation: scaleAnimation,
                    builder: (context, child) => Transform.scale(
                          scale: scaleAnimation.value,
                          child: Container(
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xFF00B87C),
                                    Color(0xFFFFFFFF),
                                  ],
                                ),
                              )),
                        )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
