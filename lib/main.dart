import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:zurian/pager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: INTRO(),
    );
  }
}
