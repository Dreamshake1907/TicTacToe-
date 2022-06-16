import 'package:flutter/material.dart';
import 'main.dart';
import 'players_info.dart';
import 'game_panel.dart';

class homePage extends StatefulWidget {
  String winnerdisplay = '';
  String scoreWinner = '';
  String winnerXoX = '';
  bool iconholder = true;
  homePage(
      {Key? key,
      required this.iconholder,
      required this.winnerdisplay,
      required this.scoreWinner,
      required this.winnerXoX})
      : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double heigth = MediaQuery.of(context).size.height;
    ThemeData(primaryColor: Colors.green);
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        title: Text('Welcome to TTT'),
      ),
      body: Column(children: [
        Container(
          alignment: Alignment.topCenter,
          child: Stack(
            fit: StackFit.loose,
            alignment: Alignment.topCenter,
            children: [
              topContainer,
              background,
              Positioned(
                child: logo,
                top: 150,
              ),
              Positioned(top: 385, child: circle)
            ],
          ),
        ),
        SizedBox(
          height: 50,
        ),
        GestureDetector(
          child: Text(
            'Continue >>',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 40,
                color: Colors.green.shade300),
          ),
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => playerPanel(
                    iconholder: widget.iconholder,
                    winnerXoX: widget.winnerXoX,
                    scoreWinner: widget.scoreWinner,
                    winnerdisplay: widget.winnerdisplay,
                  ))),
        )
      ]),
    );
  }
}

Widget topContainer = Container(
  alignment: Alignment.topCenter,
  width: 520,
  height: 500,
);
Widget background = Container(
    height: 400,
    width: 400,
    child: Image.asset('images/background.png', fit: BoxFit.cover));

Widget logo = Container(
  height: 90,
  width: 130,
  child: Image.asset(
    'images/words.png',
    fit: BoxFit.cover,
  ),
);

Widget circle = Container(
  width: 100,
  height: 100,
  decoration: BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
  child: Center(
    child: Text(
      'V 1.0',
      style: TextStyle(
          color: Colors.black, fontSize: 26, fontWeight: FontWeight.w800),
    ),
  ),
);
