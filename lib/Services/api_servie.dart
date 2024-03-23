
import 'package:http/http.dart' as http;
class ApiService {
  static const String baseUrl = 'https://reqres.in/api';

  static Future<http.Response> loginUser(String email, String password) async {
    final String apiUrl = '$baseUrl/login';
    final Map<String, String> body = {
      'email': email,
      'password': password,
    };

    final response = await http.post(Uri.parse(apiUrl), body: body);
    return response;
  }
}