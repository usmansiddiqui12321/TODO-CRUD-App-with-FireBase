import 'package:crud_firestore_app/Validators/database.dart';
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
          return Text("Error in Steam Builder");
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
                    color: Colors.grey[700],
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  onTap: () {
                    Get.to(EditItemScreen(
                        currentTitle: title,
                        currentDescription: description,
                        documentID: docID));
                  },
                  title: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Colors.white60,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  subtitle: Text(
                    description,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Colors.white60,
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                ),
              );
            },
          );
        }
        // ignore: prefer_const_constructors
        return Center(
          child: const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.orangeAccent),
          ),
        );
      },
    );
  }
}
