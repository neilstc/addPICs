// import flutter library
import 'package:flutter/material.dart';
import 'dart:convert';
//import 'package:pics/src/models/image_model.dart';
import 'image_model.dart';
import 'widgets/image_list.dart';
import 'package:http/http.dart' show get;

class App extends StatefulWidget {
  createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = [];

  void fetchImage() async {
    counter++;
    var response = await get(
      "http://jsonplaceholder.typicode.com/photos/$counter",
    );
    var imagerModel = ImageModel.fromJson(json.decode(response.body));
    setState(() {
      images.add(imagerModel);
    });
  }

  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: ImageList(images),
        appBar: AppBar(
          title: Text("Lets Nindor Pictures"),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: fetchImage, // reference to a function;
        ),
      ),
    );
  }
}

// create a class that will be our costume widget
// extends the stateless widget class
// we most define a build method that returns the widget that this widget will show
