import 'package:crud_firestore_app/Validators/database.dart';
import 'package:crud_firestore_app/res/Colors/AppColors.dart';
import 'package:crud_firestore_app/views/edit_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemList extends StatelessWidget {
  const ItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Database.readitems(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text(
            "Error in Steam Builder",
            style: TextStyle(color: AppColors.blackColor),
          );
        } else if (snapshot.hasData || snapshot.data != null) {
          return ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              height: 16,
            ),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var noteinfo =
                  snapshot.data!.docs[index].data() as Map<String, dynamic>;
              String docID = snapshot.data!.docs[index].id;
              String title = noteinfo['title'];
              String description = noteinfo['description'];
              return Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColors.primaryColor,
                    width: 3,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(
                        color: AppColors.primaryColor,
                        offset: Offset(0, 4),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: ListTile(
                    onTap: () {
                      Get.to(EditItemScreen(
                        currentTitle: title,
                        currentDescription: description,
                        documentID: docID,
                      ));
                    },
                    title: Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    subtitle: Text(
                      description,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }
        return const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.orangeAccent),
          ),
        );
      },
    );
  }
}
