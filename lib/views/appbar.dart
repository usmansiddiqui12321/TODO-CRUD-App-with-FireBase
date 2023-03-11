import 'package:flutter/material.dart';

import '../res/Colors/AppColors.dart';

class Appbar extends StatelessWidget {
  const Appbar({super.key, required this.sectionName});
  final String sectionName;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset("assets/firebase-logo.png", height: 20),
        const SizedBox(width: 8),
        const Text("Flutter Fire",
            style:
                TextStyle(color: AppColors.primaryButtonColor, fontSize: 18)),
        const SizedBox(width: 5),
        Text(sectionName,
            style: const TextStyle(
                color: Color.fromARGB(255, 144, 201, 1), fontSize: 18))
      ],
    );
  }
}
