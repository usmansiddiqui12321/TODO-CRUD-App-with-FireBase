import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../res/Colors/AppColors.dart';
import 'login/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Center(
        child: Hero(
          tag: 'animation',
          child: Lottie.asset(
            'animations/firebase.json',
            repeat: true,
            reverse: true,
            height: 300,
            frameRate: FrameRate(60),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
