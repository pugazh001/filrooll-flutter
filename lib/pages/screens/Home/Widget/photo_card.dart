// lib/screens/photo_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class PhotoDetailScreen extends StatelessWidget {
  final Map<String, dynamic> photo;

  PhotoDetailScreen({required this.photo});

  void _savePhoto(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> savedPhotos = prefs.getStringList('saved_photos') ?? [];
    savedPhotos.add(json.encode(photo));
    await prefs.setStringList('saved_photos', savedPhotos);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Photo saved!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(photo['user']['name']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(photo['urls']['regular']),
            SizedBox(height: 16),
            Text(
              photo['alt_description'] ?? 'No description',
              style: TextStyle(fontSize: 16),
            ),
              Text(
              photo['slug'] ?? 'No description',
              style: TextStyle(fontSize: 16),
            ),

            Spacer(),
            ElevatedButton(
              onPressed: () => _savePhoto(context),
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
