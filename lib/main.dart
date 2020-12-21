import 'package:facebook_newsfeed_simple_ui/screens/details.dart';
import 'package:facebook_newsfeed_simple_ui/screens/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/details": (context) => DetailsPage(),
      },
      debugShowCheckedModeBanner: false,
      title: "Facebook NewsFeed Simple UI",
      home: HomePage(),
    );
  }
}
