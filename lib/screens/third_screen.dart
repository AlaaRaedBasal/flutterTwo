import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp2/models/photo.dart';
import 'package:flutterapp2/models/photo_list.dart';
import 'package:flutterapp2/widgets/menu.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({ key }) : super(key: key);

  @override
   Widget build(BuildContext context) {
    return new Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('Third Screen title'),
      ),
      body: Center(
        child: FutureBuilder(
          future: fetchPhotos(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return Center(
              child: snapshot.hasData
                  ? PhotoList(photos: snapshot.data)
                  : CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

Future<List<Photo>> fetchPhotos() async {
  final response = await http.get('http://jsonplaceholder.typicode.com/photos');
  final reponseBody = response.body;

  return compute(parsePhoto, reponseBody);
}

List<Photo> parsePhoto(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}