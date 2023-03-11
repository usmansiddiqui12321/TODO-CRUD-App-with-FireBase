import 'package:crud_firestore_app/res/Colors/AppColors.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField(
      {super.key,
      required this.controller,
      required this.focusNode,
      required this.keyboardType,
      required this.inputAction,
      required this.label,
      required this.hint,    
      required this.validator,
      this.isObscure = false,
      this.isCaptalized = false,
      this.maxlines = 1,
      this.islabelEnabled = false,
      this.enabledBorderColor = AppColors.whiteColor,
      required this.initial});
  final TextEditingController controller;
  final FocusNode focusNode;
  final TextInputType keyboardType;
  final TextInputAction inputAction;
  final String label;
  final String hint;
  final Function(String value) validator;
  final bool isObscure;
  final bool isCaptalized;
  final int maxlines;
  final String initial;
  final bool islabelEnabled;
  final Color enabledBorderColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initial,
      maxLines: maxlines,
      keyboardType: keyboardType,
      obscureText: isObscure,
      textCapitalization:
          isCaptalized ? TextCapitalization.words : TextCapitalization.none,
      textInputAction: inputAction,
      cursorColor: Colors.white,
      validator: (value) => validator(value!),
      decoration: InputDecoration(
          labelText: islabelEnabled ? label : null,
          labelStyle: const TextStyle(color: AppColors.primarytextColor),
          hintText: hint,
          hintStyle: const TextStyle(color: AppColors.primaryColor),
          errorStyle:
              const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:
                const BorderSide(color: AppColors.primaryColor, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: enabledBorderColor, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.red, width: 2),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.red, width: 2),
          )),
    );
  }
}
