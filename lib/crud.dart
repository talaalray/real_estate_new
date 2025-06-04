import 'package:http/http.dart' as http;
import 'dart:convert';

class Crud {

  Future<Map<String, dynamic>?> getRequest(String url) async {
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        print("Error status code: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error Catch $e");
      return null;
    }
  }

  Future<Map<String, dynamic>?> postRequest(String url, Map<String, dynamic> data) async {
    try {
      var response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(data),
      );

      print("Status code: ${response.statusCode}");
      print("Response body: ${response.body}");

      return jsonDecode(response.body);
    } catch (e) {
      print("Error Catch $e");
      return {
        "status": "error",
        "error": e.toString(),
      };
    }
  }


}