import 'package:crud_firestore_app/views/add_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/Colors/AppColors.dart';
import '../Item_List.dart';
import '../appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[850],
        title: const Appbar(
          sectionName: 'CRUD',
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(const AddScreen());
          },
          backgroundColor: AppColors.primaryButtonColor,
          child: const Icon(Icons.add, color: Colors.white, size: 32)),
      body:  SafeArea(
          child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
              child: SizedBox( 
      width: MediaQuery.of(context).size.width * .8,child: ItemList()))),
    );
  }
}
