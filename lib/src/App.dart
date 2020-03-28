import 'package:flutter/material.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  int _imageCount = 0;

  void _addImage() {
    setState(() {
      ++_imageCount;
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
          child: Text('Image - $_imageCount'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: _addImage,
        ),
      ),
    );
  }
}