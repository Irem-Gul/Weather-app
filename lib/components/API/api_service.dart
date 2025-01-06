import 'dart:convert';
import 'package:http/http.dart' as http;
import 'post.dart';

class ApiService {
  static Future<List<Album>> fetchAlbumData() async {
    final response = await http.get(Uri.parse('http://127.0.0.1:8080/readings'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => Album.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
