import 'package:crud_firestore_app/Controllers/FormController.dart';
import 'package:crud_firestore_app/views/add_item_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        backgroundColor: Colors.grey[850],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey[850],
          title: const Appbar(
            sectionName: 'CRUD',
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
