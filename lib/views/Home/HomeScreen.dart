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
      appBar: AppBar(
        shadowColor: AppColors.primaryColor,
        elevation: 0,
        automaticallyImplyLeading: false,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(const AddScreen());
        },
        backgroundColor: AppColors.logo,
        child: const Icon(Icons.add, size: 32),
      ),
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 15, left: 16, right: 16, bottom: 20),
          child: Center(
            child: SizedBox(
                width: MediaQuery.of(context).size.width * .9,
                child: const ItemList()),
          ),
        ),
      ),
    );
  }
}
