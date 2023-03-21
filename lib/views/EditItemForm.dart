import 'package:crud_firestore_app/Controllers/FormController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Validators/Validator.dart';
import '../Validators/database.dart';
import '../custom_form_field.dart';
import '../res/Colors/AppColors.dart';
import '../res/Components/RoundButton.dart';

class EditItemForm extends StatefulWidget {
  const EditItemForm(
      {super.key,
      required this.documentID,
      required this.currentTitle,
      required this.currentDescription});

  final String documentID, currentTitle, currentDescription;
  @override
  State<EditItemForm> createState() => _EditItemFormState();
}

class _EditItemFormState extends State<EditItemForm> {
  final fc = Get.put(FormController()); //FormController

  String updateTitle = '';
  String updateDescription = '';
  final addItemFormState = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: addItemFormState,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const SizedBox(height: 24),
                  const Text('title',
                      style: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 22,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border:
                          Border.all(color: AppColors.primaryColor, width: 1.5),
                      boxShadow: const [
                        BoxShadow(
                          color: AppColors.primaryColor,
                          offset: Offset(0, 4),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: CustomFormField(
                        controller: fc.titleController.value,
                        initial: widget.currentTitle,
                        focusNode: fc.titlefocus.value,
                        hint: 'Write Your Title',
                        inputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        label: 'Title',
                        validator: (value) {
                          Validator.validateField(value: value);
                          updateTitle = value;
                        }),
                  ),
                  const SizedBox(height: 20),
                  const Text('Description',
                      style: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 22,
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border:
                          Border.all(color: AppColors.primaryColor, width: 1.5),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: const [
                        BoxShadow(
                          color: AppColors.primaryColor,
                          offset: Offset(0, 4),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: CustomFormField(
                        initial: widget.currentDescription,
                        maxlines: 10,
                        controller: fc.discriptionController.value,
                        focusNode: fc.discriptionfocus.value,
                        hint: 'Write Your Description',
                        inputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        label: 'Description',
                        validator: (value) {
                          Validator.validateField(value: value);
                          updateDescription = value;
                        }),
                  ),
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
                      await Database.updateItem(
                          title: updateTitle,
                          description: updateDescription,
                          docId: widget.documentID);
                      fc.isProcessing.value = false;
                      Get.back();
                    },
                    title: 'Update Item',
                    textColor: AppColors.whiteColor,
                    buttonColor: AppColors.primaryButtonColor,
                  )
          ],
        ),
      ),
    );
  }
}
