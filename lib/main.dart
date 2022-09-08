import 'package:contact_app/utils/constants.dart';
import 'package:contact_app/view/splash_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ProjectTexts.appTitle,
      home: SplashView(),
    );
  }
}
