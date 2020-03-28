import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './models/ImageModel.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  int _imageCounter = 1;

  dynamic _fetchImage() async {
    final imageAPI = 'https://jsonplaceholder.typicode.com/photos/$_imageCounter';
    final res = await http.get(imageAPI);
    return json.decode(res.body);
  }

  void _addImage() async {
    final json = await _fetchImage();
    final newImage = ImageModel.fromJSON(json);

    setState(() {
      ++_imageCounter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Let\'s See Images!'),
        ),
        body: Center(
          child: Text('Image - $_imageCounter'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: _addImage,
        ),
      ),
    );
  }
}