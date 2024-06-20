// lib/services/unsplash_service.dart
/*
import 'dart:convert';
import 'package:http/http.dart' as http;

class UnsplashService {
  static const String _apiKey = 'cQ4-IJlK4xBWu2yhPBrt1sSeYlYUTohvLnc9IvzZCVI';
  static const String _baseUrl = 'https://api.unsplash.com';

  Future<List<dynamic>> fetchPhotos() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/photos?client_id=$_apiKey'),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load photos');
    }
  }
}
*/
// lib/services/unsplash_service.dart

/*
class UnsplashService {
  static const String _apiKey = 'cQ4-IJlK4xBWu2yhPBrt1sSeYlYUTohvLnc9IvzZCVI';
  static const String _baseUrl = 'https://api.unsplash.com/photos';

  Future<List<Photo>> fetchPhotos() async {
    final response = await http.get(
      Uri.parse('$_baseUrl?client_id=$_apiKey'),
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Photo.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load photos');
    }
  }
}
*/
// lib/services/unsplash_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class UnsplashService {
  static const String _apiKey = 'cQ4-IJlK4xBWu2yhPBrt1sSeYlYUTohvLnc9IvzZCVI';
  static const String _baseUrl = 'https://api.unsplash.com';

  Future<List<dynamic>> fetchPhotos() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/photos?client_id=$_apiKey'),
    );
    print(response.body);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load photos');
    }
  }
}
