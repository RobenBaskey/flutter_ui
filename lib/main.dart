import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/drawer_screen.dart';
import 'package:flutter_ui/pages/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: <Widget>[
              DrawerScreen(),
              HomeScreen(),
            ],
          ),
        ),
      ),
    );
  }
}

