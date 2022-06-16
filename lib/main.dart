import 'home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to TTT',
      theme: ThemeData(primarySwatch: Colors.lightGreen),
      home: homePage(
        iconholder: true,
        winnerdisplay: '',
        scoreWinner: '',
        winnerXoX: '',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  String winnerdisplay = '';
  String winnerXoX = '';
  String scoreWinner = '';
  MyHomePage(
      {Key? key,
      required this.title,
      required this.winnerdisplay,
      required this.scoreWinner,
      required this.winnerXoX})
      : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
