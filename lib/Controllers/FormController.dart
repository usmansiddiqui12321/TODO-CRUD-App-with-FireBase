import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormController extends GetxController {
  final titleController = TextEditingController().obs;
  final discriptionController = TextEditingController().obs;
  final titlefocus = FocusNode().obs;
  final discriptionfocus = FocusNode().obs;
  final RxBool isProcessing = false.obs;
  final RxBool isDeleting = false.obs;


}
