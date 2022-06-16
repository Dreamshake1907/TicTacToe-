import 'package:flutter/material.dart';
import 'main.dart';
import 'home.dart';
import 'game_panel.dart';

class playerPanel extends StatefulWidget {
  String winnerdisplay = '';
  String scoreWinner = '';
  String winnerXoX = '';
  bool iconholder = true;
  playerPanel(
      {Key? key,
      required this.iconholder,
      required this.winnerdisplay,
      required this.scoreWinner,
      required this.winnerXoX})
      : super(key: key);

  @override
  State<playerPanel> createState() => _playerPanelState();
}

class _playerPanelState extends State<playerPanel> {
  bool iconholder = true;

  final userP1controller = TextEditingController();
  final userP2controller = TextEditingController();

  String player1 = 'Player1';
  String player2 = 'Player2';

  bool switchPlayer = true;

  @override
  Widget build(BuildContext context) {
    ThemeData(primaryColor: Colors.green);
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Players Panel',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            width: 400,
            height: 1,
            color: Color.fromARGB(255, 80, 80, 80).withOpacity(0.5),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 1),
                  blurRadius: 5,
                  color: Colors.black.withOpacity(0.3),
                ),
              ],
            ),
            padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
            width: 380,
            height: 85,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 50,
                  width: 30,
                  child: Icon(Icons.account_box,
                      color: Color.fromARGB(255, 110, 110, 110)),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        textAlign: TextAlign.start,
                        controller: userP1controller,
                      ),
                      Text(switchPlayer == true ? player1 : player2,
                          style: TextStyle(
                              color: Color.fromARGB(255, 110, 110, 110)))
                    ],
                  ),
                  width: 200,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  alignment: Alignment.center,
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: switchPlayer == true ? Colors.blue : Colors.red),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          new SizedBox(
              height: 20.0,
              width: 28.0,
              child: new IconButton(
                padding: new EdgeInsets.all(0.0),
                icon: Icon(Icons.thumbs_up_down, size: 30.0),
                onPressed: playerChanger,
              )),
          SizedBox(
            height: 25,
          ),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 1),
                  blurRadius: 5,
                  color: Colors.black.withOpacity(0.3),
                ),
              ],
            ),
            padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
            width: 350,
            height: 85,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 50,
                  width: 30,
                  child: Icon(Icons.account_box,
                      color: Color.fromARGB(255, 110, 110, 110)),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        textAlign: TextAlign.start,
                        controller: userP2controller,
                      ),
                      Text(
                        (switchPlayer == true ? player2 : player1),
                        style: TextStyle(
                            color: Color.fromARGB(255, 110, 110, 110)),
                      )
                    ],
                  ),
                  width: 200,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  alignment: Alignment.center,
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: switchPlayer == true ? Colors.red : Colors.blue),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 400,
            height: 1,
            color: Color.fromARGB(255, 80, 80, 80).withOpacity(0.5),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.topCenter,
            child: Column(children: [
              Text(
                'Heros List :',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2,
                    fontSize: 22,
                    color: Color.fromARGB(255, 87, 87, 87)),
              ),
            ]),
            height: 30,
          ),
          Expanded(
            child: ListView(
              children: [
                Dismissible(
                  key: UniqueKey(),
                  child: ListTile(
                    title: Text('${widget.winnerdisplay}',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: Colors.black)),
                    subtitle: Text(
                      '${widget.winnerXoX}',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color:
                              switchPlayer == true ? Colors.blue : Colors.red),
                    ),
                    leading: Icon(
                      Icons.star,
                      color: widget.iconholder == true
                          ? Colors.green.shade50
                          : Colors.orange,
                      size: 50,
                    ),
                    trailing: Text(
                      '${widget.scoreWinner}',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: Colors.brown),
                    ),
                  ),
                  background: Container(
                    color: Colors.red,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [Icon(Icons.delete)]),
                  ),
                  onDismissed: (DismissDirection direction) {
                    direction == DismissDirection.startToEnd;
                  },
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            padding: EdgeInsets.all(15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(120),
              child: SizedBox(
                width: 50,
                height: 50,
                child: RawMaterialButton(
                  onPressed: () {
                    playerName();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => gamePanel(
                              Player1: player1,
                              Player2: player2,
                            )));
                  },
                  elevation: 2.0,
                  fillColor: Colors.green,
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 35.0,
                  ),
                  padding: EdgeInsets.zero,
                  shape: CircleBorder(
                    side: BorderSide(
                        width: 5,
                        color: Colors.green,
                        style: BorderStyle.solid),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  playerName() {
    setState(() {
      playerChanger();
      if (switchPlayer == false) {
        player1 = userP1controller.text;

        player2 = userP2controller.text;
      } else {
        player1 = userP2controller.text;

        player2 = userP1controller.text;
      }

      if (player2 == '') {
        player2 = 'Player 2';
      }
      if (player1 == '') {
        player1 = 'Player 1';
      }
    });
  }

  playerChanger() {
    setState(() {
      switchPlayer = !switchPlayer;
    });
  }
}
