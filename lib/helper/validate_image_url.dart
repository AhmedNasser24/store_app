import 'package:http/http.dart' as http;
Future<String?> validateImageURL(String imageUrl) async {
  try {
    final response = await http.head(Uri.parse(imageUrl));

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return null; // URL is valid
    } else {
      return 'Image URL is not accessible'; // URL is not valid
    }
  } catch (e) {
    return 'Image URL is not accessible ,so we put image instead'; // Error occurred, URL is not valid
  }
}
