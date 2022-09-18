import 'dart:convert';

import 'package:BasicApp/provider/UserDetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'getxControllers/UserDetailsController.dart';

class APIScreen extends StatefulWidget {
  const APIScreen({Key? key}) : super(key: key);

  @override
  State<APIScreen> createState() => _APIScreenState();
}

class _APIScreenState extends State<APIScreen> {

  // late Album futureAlbum;
  String albumDetails = "";
  String createAlbumResponse = "";

  final UserDetailsController userDetails = Get.find();

  void fetchAlbum() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      setState(() {
        albumDetails = Album.fromJson(jsonDecode(response.body)).toString();
      });
      // futureAlbum = Album.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<Album> createAlbum(String title) async {
    final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/albums'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': title,
      }),
    );

    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      setState(() {
        createAlbumResponse = Album.fromJson(jsonDecode(response.body)).toString();
      });
      return Album.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album.');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchAlbum();
    createAlbum("New Album");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text("From Getx(App level state)", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("User Password: ${userDetails.password}"),
            ),
            const Text("From Provider(App level state)", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("User Password: ${context.watch<UserDetails>().password}"),
            ),
            const Text("From network response(GET)", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(albumDetails),
            ),
            const Text("From network response(POST)", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(createAlbumResponse),
            ),
          ],
        ),
      ),
    );
  }
}

class Album {
  // final int userId;
  final int id;
  final String title;

  const Album({
    // required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      // userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }

  factory Album.fromJsonResponse(Map<String, dynamic> json) {
    return
      Album(
        id: json['id'],
        title: json['title'],
      );
  }

  @override
  String toString() {
    // return 'Album{userId: $userId, id: $id, title: $title}';
    return 'Album{id: $id, title: $title}';
  }
}
