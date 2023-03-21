import 'package:crud_firestore_app/Controllers/FormController.dart';
import 'package:crud_firestore_app/views/add_item_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../res/Colors/AppColors.dart';
import 'appbar.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final formController = Get.put(FormController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: AppColors.whiteColor),
          automaticallyImplyLeading: true,

          elevation: 0,
          title: const Appbar(
            sectionName: 'CRUD',
          ),
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryColor,
                  offset: Offset(0, 4),
                  blurRadius: 1.2,
                ),
              ],
            ),
          ),
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
          child: AddItemForm(
              titlefocusNode: formController.titlefocus.value,
              descriptionfocusNode: formController.discriptionfocus.value),
        )),
      ),
    );
  }
}
