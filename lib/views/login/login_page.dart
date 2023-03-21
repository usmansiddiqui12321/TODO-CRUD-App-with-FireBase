import 'package:crud_firestore_app/res/Colors/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controllers/LoginControllers.dart';

import 'Loginform.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final LoginController loginVM;
  late final Future<void> _initFuture;

  @override
  void initState() {
    super.initState();
    loginVM = Get.put(LoginController());
    _initFuture = loginVM.initializeFirebase();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        loginVM.uidFocusNode.value.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.whiteColor,
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                              flex: 1,
                              child: Image.asset('assets/firebase-logo.png',
                                  height: 200)),
                          const SizedBox(height: 20),
                          const Text(
                            "Flutter Fire",
                            style: TextStyle(
                                color: AppColors.blackColor, fontSize: 40),
                          ),
                          const Text("CRUD",
                              style: TextStyle(
                                  color: AppColors.blackColor, fontSize: 40)),
                        ],
                      ),
                    ),
                    FutureBuilder(
                      future: _initFuture,
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return const Text("Error h bhai error");
                        } else if (snapshot.connectionState ==
                            ConnectionState.done) {
                          return const LoginForm();
                        } else {
                          return const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.orangeAccent),
                          );
                        }
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
