import 'package:appwrite/appwrite.dart';
import 'package:get/get.dart';

class ClientController extends GetxController {
  Client client = Client();
  @override
  void onInit() {
    super.onInit();
    Databases databases = Databases(client);

// appwrite
    const endPoint = "https://cloud.appwrite.io/v1";
    const projectID = "6565b3df9d701f0c94ae";
    client
        .setEndpoint(endPoint)
        .setProject(projectID)
        .setSelfSigned(status: true);

    Future result = databases.listDocuments(
      databaseId: '656ddb2be596aef87b65',
      collectionId: '656ddc0454829f1fcaea',
    );

    result.then((response) {
      print(response);
    }).catchError((error) {
      print(error.response);
    });
  }
}
