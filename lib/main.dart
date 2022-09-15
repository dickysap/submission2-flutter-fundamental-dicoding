import 'package:flutter/material.dart';
import 'package:makan_makan/Screen/page/detail.dart';
import 'package:makan_makan/Screen/page/home.dart';
import 'package:makan_makan/Screen/page/review.dart';
import 'package:makan_makan/Screen/page/search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Warung Tiwi',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        DetailPage.routeName: (context) => DetailPage(
            id: ModalRoute.of(context)?.settings.arguments as String),
        SearchPage.routeName: (context) => SearchPage(),
        ReviewPage.routeName: (context) =>
            ReviewPage(id: ModalRoute.of(context)?.settings.arguments as String)
      },
    );
  }
}
