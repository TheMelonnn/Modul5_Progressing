import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:module_app/data/models/book.dart';

class api_book extends GetxController {
  static const String _C1 =
      "https://www.googleapis.com/books/v1/volumes?q=subject:thriller&download=epub&orderBy=newest&key=AIzaSyAqxw3nnCxwNQXRmXb-ZFi8FTNyhz6kwGA";
  RxList<Book> posts = RxList([]);

  Future<void> fetchPosts() async {
    try {
      // isLoading.value = true; // Set loading state to true
      final response = await http.get(Uri.parse(_C1));
      if (response.statusCode == 200) {
        print('Data:: ${response.body}');
        final jsonData = response.body;
        final postResult = bookFromJson(jsonData);
        posts.value = postResult as List<Book>;
        // print('Response: $postResult');
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('An error occurred: $e');
    } finally {
      // isLoading.value = false; // Set loading state to false when done
    }
  }

  @override
  void onInit() async {
    await fetchPosts();
    super.onInit();
  }
}