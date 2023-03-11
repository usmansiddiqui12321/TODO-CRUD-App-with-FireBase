import 'package:crud_firestore_app/Validators/Validator.dart';
import 'package:crud_firestore_app/Validators/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/FormController.dart';
import '../custom_form_field.dart';
import '../res/Colors/AppColors.dart';
import '../res/Components/RoundButton.dart';

class AddItemForm extends StatefulWidget {
  const AddItemForm(
      {super.key,
      required this.titlefocusNode,
      required this.descriptionfocusNode});
  final FocusNode? titlefocusNode;
  final FocusNode? descriptionfocusNode;
  @override
  State<AddItemForm> createState() => _AddItemFormState();
}

class _AddItemFormState extends State<AddItemForm> {
  final fc = Get.put(FormController()); //FormController

  String getTitle = '';
  String getDescription = '';
  final addItemFormState = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * .5,
          child: Form(
            key: addItemFormState,
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 20),
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const SizedBox(height: 24),
                      const Text('title',
                          style: TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: 22,
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      CustomFormField(
                          initial: "",
                          controller: fc.titleController.value,
                          focusNode: fc.titlefocus.value,
                          hint: 'Write Your Title',
                          inputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          label: 'Title',
                          validator: (value) {
                            Validator.validateField(value: value);
                            getTitle = value;
                          }),
                      const SizedBox(height: 20),
                      const Text('Description',
                          style: TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: 22,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      CustomFormField(
                          maxlines: 10,
                          initial: "",
                          controller: fc.discriptionController.value,
                          focusNode: fc.discriptionfocus.value,
                          hint: 'Write Your Description',
                          inputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          label: 'Description',
                          validator: (value) {
                            Validator.validateField(value: value);
                            getDescription = value;
                          }),
                    ],
                  ),
                ),
                fc.isProcessing.value
                    ? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.orangeAccent))
                    : RoundButton(
                        onpress: () async {
                          FocusScope.of(context).unfocus();
                          if (addItemFormState.currentState!.validate()) {
                            fc.isProcessing.value = true;
                          }
                          await Database.addItem(
                              title: getTitle, description: getDescription);
                          fc.isProcessing.value = false;
                          Get.back();
                        },
                        title: 'Add Item',
                        textColor: AppColors.whiteColor,
                        buttonColor: AppColors.primaryButtonColor,
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
