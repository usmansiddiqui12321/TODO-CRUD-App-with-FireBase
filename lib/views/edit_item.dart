import 'package:crud_firestore_app/Controllers/FormController.dart';
import 'package:crud_firestore_app/Validators/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../res/Colors/AppColors.dart';
import 'EditItemForm.dart';
import 'appbar.dart';

class EditItemScreen extends StatefulWidget {
  const EditItemScreen(
      {super.key,
      required this.currentTitle,
      required this.currentDescription,
      required this.documentID});
  final String currentTitle, currentDescription, documentID;
  @override
  State<EditItemScreen> createState() => _EditItemScreenState();
}

class _EditItemScreenState extends State<EditItemScreen> {
  final fc = Get.put(FormController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: AppColors.whiteColor),
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
          actions: [
            fc.isDeleting.value
                ? const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10, right: 16),
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.redAccent),
                      strokeWidth: 3,
                    ),
                  )
                : IconButton(
                    onPressed: () async {
                      fc.isDeleting.value = true;

                      await Database.deleteItem(docId: widget.documentID);
                      fc.isDeleting.value = false;
                      Get.back();
                    },
                    icon: const Icon(Icons.delete_forever,
                        color: Colors.red, size: 32))
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 1,
              child: EditItemForm(
                currentDescription: widget.currentDescription,
                currentTitle: widget.currentTitle,
                documentID: widget.documentID,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
