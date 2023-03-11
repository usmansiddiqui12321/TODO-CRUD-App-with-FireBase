import 'package:crud_firestore_app/Validators/Validator.dart';
import 'package:crud_firestore_app/Validators/database.dart';
import 'package:crud_firestore_app/res/Colors/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controllers/LoginControllers.dart';
import '../../custom_form_field.dart';
import '../../res/Components/RoundButton.dart';
import '../Home/HomeScreen.dart';

class loginForm extends StatefulWidget {
  const loginForm({super.key});

  @override
  State<loginForm> createState() => _loginFormState();
}

class _loginFormState extends State<loginForm> {
  String getID = "";
  final loginVM = Get.put(LoginController());
  final _loginFormkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .3,
        width: MediaQuery.of(context).size.width * .6,
        child: Form(
          key: _loginFormkey,
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 28),
                child: Column(
                  children: [
                    CustomFormField(
                        controller: loginVM.uidController.value,
                        focusNode: loginVM.uidFocusNode.value,
                        keyboardType: TextInputType.text,
                        initial: "",
                        enabledBorderColor: AppColors.blackColor,
                        inputAction: TextInputAction.done,
                        label: 'Unique User ID',
                        hint: 'Enter Unique Identifier',
                        validator: (value) {
                          Validator.validateUserID(uid: value);
                          getID = value;
                        })
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 0, right: 0),
                child: Container(
                  width: double.maxFinite,
                  child: RoundButton(
                      onpress: () {
                        loginVM.uidFocusNode.value.unfocus();
                        if (_loginFormkey.currentState!.validate()) {
                          Database.userId = getID;
                          Get.to(HomeScreen());
                        }
                      },
                      title: "Login"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}