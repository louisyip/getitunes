import 'package:flutter/material.dart';
import 'albumList.dart';
import 'savedList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: TabBar(
            tabs: [
              Tab(text: 'Album List'),
              Tab(text: 'Saved List'),
            ],
          ),
        ),
        body: TabBarView(
          children: [AlbumListPage(), SavedListPage()],
        ),
      ),
    ));
  }
}

class Book extends StatelessWidget {
  final String imgSrc;
  final String name;

  Book({this.imgSrc, this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.network(imgSrc),
        ),
        Text(name)
      ],
    );
  }
}
