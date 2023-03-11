import 'package:firebase_core/firebase_core.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';

class LoginController extends GetxController {
  final uidController = TextEditingController().obs;
  // final passwordController = TextEditingController().obs;
  final uidFocusNode = FocusNode().obs;
  // final passwordFocusNode = FocusNode().obs;

  Future<FirebaseApp> initializeFirebase() async {
    final firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }
}
