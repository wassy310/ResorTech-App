import 'package:http/http.dart' as http;
import 'dart:convert';

class ResortechRepository {
  Future<Map<String, dynamic>> fetchResortechData(String resortechId) async {
    final response = await http.get(Uri.parse(
        'https://product-api.resortech.com/api/v1/deeplearning/$resortechId'));
    if (response.statusCode == 200) {
      return json.decode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
