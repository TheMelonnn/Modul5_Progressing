import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:module_app/presentation/controllers/dashboard_controller.dart';
import 'package:module_app/presentation/controllers/database_controller.dart';
import 'package:module_app/presentation/routes/routes.dart';

class Favorite extends GetView<DashboardController> {
  final DatabaseController _databasecontroller = Get.put(DatabaseController());

  Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Buku'),
      ),
      body: ListView.builder(
        itemCount: controller.databaseController.bookData.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Id " + controller.databaseController.bookData[index].$id,
                    style: TextStyle(color: Colors.grey)),
                Text(
                  controller
                      .databaseController.bookData[index].data['Judul_Buku'],
                  style: TextStyle(fontSize: 30, color: Colors.orange),
                ),
                Text(
                  "Deskripsi : " +
                      controller.databaseController.bookData[index]
                          .data['Deskripsi_Buku'],
                  style: TextStyle(color: Colors.black54),
                ),
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: () async {
                          final document_id =
                              controller.databaseController.bookData[index].$id;
                          await _databasecontroller.deleteDocument(document_id);
                        },
                        child: Text("Delete")),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          String book_id = controller.databaseController.bookData[index].$id;
                          Get.toNamed(AppPage.UpdateDatabase, arguments: {"book_id" : book_id});
                        },
                        child: Text("Update")),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
