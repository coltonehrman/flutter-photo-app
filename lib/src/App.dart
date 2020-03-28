import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './models/ImageModel.dart';
import './widgets/ImageList.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  int _imageCounter = 1;
  List<ImageModel> _images = [];

  dynamic _fetchImage() async {
    // moved the imageCounter incrememting to here to prevent
    // consecutive calls overlapping before the Future resolves
    // and making app fetch the same image more than once
    final imageAPI = 'https://jsonplaceholder.typicode.com/photos/${_imageCounter++}';
    final res = await http.get(imageAPI);
    return json.decode(res.body);
  }

  void _addImage() async {
    final json = await _fetchImage();
    final newImage = ImageModel.fromJSON(json);
    setState(() => _images.add(newImage));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Let\'s See Images!'),
        ),
        body: Center(
          child: ImageList(_images),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: _addImage,
        ),
      ),
    );
  }
}