// lib/screens/saved_photos_screen.dart

// lib/screens/saved_photos_screen.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SavedPhotosScreen extends StatelessWidget {
  Future<List<Map<String, dynamic>>> _getSavedPhotos() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> savedPhotos = prefs.getStringList('saved_photos') ?? [];
    // Casting each decoded photo to Map<String, dynamic>
    return savedPhotos.map((photo) => json.decode(photo) as Map<String, dynamic>).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Photos'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _getSavedPhotos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final photos = snapshot.data!;
            return ListView.builder(
              itemCount: photos.length,
              itemBuilder: (context, index) {
                final photo = photos[index];
                return ListTile(
                  leading: Image.network(photo['urls']['thumb']),
                  title: Text(photo['user']['name']),
                );
              },
            );
          }
        },
      ),
    );
  }
}

/*
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SavedPhotosScreen extends StatelessWidget {
  Future<List<Map<String, dynamic>>> _getSavedPhotos() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> savedPhotos = prefs.getStringList('saved_photos') ?? [];
    return savedPhotos.map((photo) => json.decode(photo)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Photos'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _getSavedPhotos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final photos = snapshot.data!;
            return ListView.builder(
              itemCount: photos.length,
              itemBuilder: (context, index) {
                final photo = photos[index];
                return ListTile(
                  leading: Image.network(photo['urls']['thumb']),
                  title: Text(photo['user']['name']),
                );
              },
            );
          }
        },
      ),
    );
  }
}
*/


/*
import "package:flutter/material.dart";
class SavedData extends StatefulWidget {
  const SavedData({super.key});

  @override
  State<SavedData> createState() => _SavedDataState();
}

class _SavedDataState extends State<SavedData> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("saved file"),
    );
  }
}
*/