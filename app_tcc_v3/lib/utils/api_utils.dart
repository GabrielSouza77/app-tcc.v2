import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiUtils {
  static Future<List<dynamic>> fetchData(String route) async {
    final response =
        await http.get(Uri.parse('http://192.168.15.46:3000/$route'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Erro na solicitação: ${response.statusCode}');
    }
  }
}
