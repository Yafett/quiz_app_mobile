import 'package:flutter/material.dart';
import 'package:permainan_matematika/pages/home-page.dart';
import 'package:permainan_matematika/pages/introduction-page.dart';
import 'package:showcaseview/showcaseview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ShowCaseWidget(
          builder: Builder(
            builder: (context) {
             return HomePage();
            },
          ),
          ),
    );
  }
}
