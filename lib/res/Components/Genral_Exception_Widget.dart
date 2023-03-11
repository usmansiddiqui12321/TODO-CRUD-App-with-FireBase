import 'package:flutter/material.dart';

import '../Colors/AppColors.dart';

class GenralExceptionWidget extends StatefulWidget {
  const GenralExceptionWidget({super.key, required this.onpress});
  final VoidCallback onpress;
  @override
  State<GenralExceptionWidget> createState() => _GenralExceptionWidgetState();
}

class _GenralExceptionWidgetState extends State<GenralExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: size.height * .15),
          const Icon(Icons.cloud_off,
              color: AppColors.secondaryButtonColor, size: 50),
          const Padding(
            padding: EdgeInsets.only(top: 30),
            child: Text('Genral_Exception', textAlign: TextAlign.center),
          ),
          SizedBox(height: size.height * .15),
          InkWell(
            onTap: widget.onpress,
            child: Container(
              height: 44,
              width: 160,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.primaryButtonColor),
              child: Center(
                child: Text("Retry",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.white)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
