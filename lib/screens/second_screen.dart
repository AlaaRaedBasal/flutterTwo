import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterapp2/models/photo.dart';
import 'package:flutterapp2/widgets/menu.dart';
import 'package:http/http.dart' as http;

class SecondScreen extends StatefulWidget {
  const SecondScreen({ key }) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
    final List<String> myList =[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title:Text('Second Screen Title')
      ),
      body: Center( 
        child:myList.length>0 ? Container(
          width: MediaQuery.of(context).size.width * 0.9,
          child: ListView.builder(
            itemCount:myList.length ,
            itemBuilder: (context, index) {
            return _buildMyList(myList[index]);
          },
          ),
        )
        :CircularProgressIndicator(),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed:() => _addPhoto()),
      
    );
  }

  Widget _buildMyList(String img){
    return Container(
      padding: EdgeInsets.only(bottom:10),
        child:Card(
          elevation: 5,
          child:Image.network(img),
    ));
  }

  _addPhoto() async{
    // print('start');
    // Future.delayed(Duration(seconds: 4),(){
    //   print('it\'s me after 4 seconds');
    // });
    final num = Random().nextInt(1000);
    final response =
    await http.get('http://jsonplaceholder.typicode.com/photos/$num');
    final parsedResponse = jsonDecode(response.body);
    final photo = Photo(
      albumId:parsedResponse['albumId'],
      id:parsedResponse['id'], 
      title:parsedResponse['title'], 
      url:parsedResponse['url'], 
      thumbnailUrl:parsedResponse['thumbnailUrls']);
      print(photo.url);
    setState(() {
          myList.add(photo.url);

    });
    print(myList.length);
  }
}