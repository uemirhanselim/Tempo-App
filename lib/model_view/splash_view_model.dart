import 'package:contact_app/view/splash_view.dart';
import 'package:flutter/material.dart';

import '../view/contacts_view.dart';

abstract class SplashViewModel extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    initialization();
  }

  Future<void> initialization() async {
    await Future.delayed(const Duration(seconds: 3));
    // ignore: use_build_context_synchronously
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const ContactsView()));
  }
}
