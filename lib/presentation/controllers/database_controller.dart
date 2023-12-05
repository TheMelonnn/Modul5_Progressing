import 'dart:convert';

import 'package:appwrite/appwrite.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'client_controller.dart';

class DatabaseController extends ClientController {
  late Databases databases;

  @override
  void onInit() {
    super.onInit();
  
    // appwrite
    databases = Databases(client);
  }


  Future<void> createDocument(Map<String, String> map) async {
    try {
      final result = await databases.createDocument(
        databaseId: "656ddb2be596aef87b65",
        documentId: ID.unique(),
        collectionId: "656ddc0454829f1fcaea",
        data: map,
        permissions: [
          Permission.read(Role.user("65669519cc2d6c7f3da2")),
          Permission.update(Role.user("65669519cc2d6c7f3da2")),
          Permission.delete(Role.user("65669519cc2d6c7f3da2")),
        ],
      );
      print("DatabaseController:: createDocument $result");
    } catch (error) {
      _showErrorDialog("Error creating document", error.toString());
    }
  }


  // Future<Map<String, String>> getDocument(String documentId) async {
  //   try {
  //     final result = await databases.getDocument(
  //       databaseId: "656ddb2be596aef87b65",
  //       collectionId: "656ddc0454829f1fcaea",
  //       documentId: documentId,
  //     );
  //     print("DatabaseController:: getDocument $result");

  //     // Explicitly cast the result to Map<String, String>
  //     final Map<String, String> data = Map<String, String>.from(result.data);

  //     return data;
  //   } catch (error) {
  //     _showErrorDialog("Error getting document", error.toString());
  //     return {};
  //   }
  // }

 Future<List<dynamic>> fetchDocuments() async {
    final response = await http.get(
      Uri.parse('https://cloud.appwrite.io/v1/collections/656ddc0454829f1fcaea/documents'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'X-Appwrite-Project': '6565b3df9d701f0c94ae',
        'X-Appwrite-Key': '9ae52c91ad3cca371786fd50143cbc2c898174a335ec1b1558a8315d858763824f8babf39433e5dbb7cfe3892333ea9e9d377dd4267537c077a3163f24988830d5d61b9d36c54e75dc907fc425411b996b9b9d8c026eaf350042943304d9dc2a11a75b0e82d9490c3bc6cec32c572f8b1249e8f2054bb6b517d1b717f5e801d7',
      },
    );

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON.
      List<dynamic> documents = json.decode(response.body);
      return documents;
    } else {
      // If that response was not OK, throw an exception.
      throw Exception('Failed to load documents');
    }
 }

  Future<void> updateDocument(
      String documentId, Map<String, String> map) async {
    try {
      final result = await databases.updateDocument(
        databaseId: "656ddb2be596aef87b65",
        collectionId: "656ddc0454829f1fcaea",
        documentId: documentId,
        data: map,
      );
      print("DatabaseController:: updateDocument $result");
    } catch (error) {
      _showErrorDialog("Error updating document", error.toString());
    }
  }

  Future<void> deleteDocument(String documentId) async {
    try {
      final result = await databases.deleteDocument(
        databaseId: "656ddb2be596aef87b65",
        collectionId: "656ddc0454829f1fcaea",
        documentId: documentId,
      );
      print("DatabaseController:: deleteDocument $result");
    } catch (error) {
      _showErrorDialog("Error deleting document", error.toString());
    }
  }

  void _showErrorDialog(String title, String errorMessage) {
    Get.defaultDialog(
      title: title,
      titlePadding: const EdgeInsets.only(top: 15, bottom: 5),
      titleStyle: Get.context?.theme.textTheme!.headline6,
      content: Text(
        errorMessage,
        style: Get.context?.theme.textTheme.bodyText2,
        textAlign: TextAlign.center,
      ),
      contentPadding: const EdgeInsets.only(top: 5, left: 15, right: 15),
    );
  }
}
