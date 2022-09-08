// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import '../model_view/splash_view_model.dart';
import '../utils/constants.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);
  @override
  State<SplashView> createState() => SplashViewState();
}

class SplashViewState extends SplashViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.splashColor,
      body: Center(
        child: Image.asset('assets/splash/Tempo.png', scale: 3),
      ),
    );
  }
}
