import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:zurian/pagerr.dart';

class INTRO extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("PAGE TRANSITION - page 1"), backgroundColor: Color(0xFF00B87C)),
        body: Center(
            child: MaterialButton(
                color: Color(0xFF00B87C),
                child: Text(
                  "click to go to second screen",
                  style: TextStyle(color: Color(0xFFFFFFFF)),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          transitionDuration: Duration(
                            seconds: 4,
                          ),
                          transitionsBuilder: (BuildContext context, Animation animation, Animation secAnimation, Widget child) {
                            animation = CurvedAnimation(
                              parent: animation,
                              curve: Curves.elasticInOut,
                            );
                            return ScaleTransition(
                              alignment: Alignment.center,
                              scale: animation,
                              child: child,
                            );
                          },
                          pageBuilder: (BuildContext context, Animation animation, Animation secAnimation) {
                            return HomePage();
                          }));
                })));
  }
}

class SecondScreen extends StatelessWidget {
  final page = [
    Container(
      color: Color(0xFFFFFFFF),
    ),
    Container(color: Color(0xFF7B8794)),
    Container(color: Color(0xFF6E9B3B)),
    Container(
      color: Colors.red,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(title: Text(" Page 2 (swipe the screen)"), backgroundColor: Color(0xFF00B87C)),
        body: LiquidSwipe(
          enableLoop: false,
          pages: page,
        ));
  }
}
