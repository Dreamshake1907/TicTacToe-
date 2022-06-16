import 'package:flutter/material.dart';
import 'home.dart';
import 'main.dart';
import 'players_info.dart';

class gamePanel extends StatefulWidget {
  String Player1;
  String Player2;

  gamePanel({
    Key? key,
    required this.Player1,
    required this.Player2,
  }) : super(key: key);

  @override
  State<gamePanel> createState() => _gamePanelState();
}

class _gamePanelState extends State<gamePanel> {
  List<String> xOxTable = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  String winnerHero = '';
  String winnerScore = '';
  String winnerXoX = '';

  bool xTurn = true;

  int xScore = 0;
  int oScore = 0;

  int tappedBoxes = 0;

  int round = 1;

  bool iconchanger = false;

  @override
  Widget build(BuildContext context) {
    ThemeData(primaryColor: Colors.green);
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            'Game Panel',
            style: TextStyle(color: Colors.black),
          )),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Container(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "${widget.Player1}, score:",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              color: Colors.blue),
                        ),
                        Text(
                          xScore.toString(),
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("${widget.Player2}, score:",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                                color: Colors.red)),
                        Text(oScore.toString(),
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                                color: Colors.red)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(0.5),
            color: Color.fromARGB(255, 43, 43, 43),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text('Round: $round',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: Colors.black))
            ]),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Row(children: [
              Text('Turn: ',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: Colors.black)),
              Text(
                  xTurn == true
                      ? '${widget.Player1} (X)'
                      : '${widget.Player2} (O)',
                  style: TextStyle(
                    color: xTurn == true ? Colors.blue : Colors.pink,
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  )),
            ]),
          ),
          Expanded(
            flex: 3,
            child: GridView.builder(
                padding: EdgeInsets.all(10),
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      tapped(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            width: 2,
                            color: Color.fromARGB(255, 0, 0, 0),
                          )),
                      child: Center(
                          child: Text(
                        xOxTable[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            //color picker condition
                            color: xOxTable[index] == "x"
                                ? Colors.blue
                                : Colors.pink,
                            fontSize: 140.0,
                            fontWeight: FontWeight.w500,
                            height: 0.8),
                      )),
                    ),
                  );
                }),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: TextButton(
                      onPressed: resetGame,
                      style: TextButton.styleFrom(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          primary: Colors.black,
                          backgroundColor: Colors.lightGreen),
                      child: Text(
                        'Reset',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      )),
                ),
                Container(
                  child: TextButton(
                      onPressed: exitDialog,
                      style: TextButton.styleFrom(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          primary: Colors.black,
                          backgroundColor: Colors.lightGreen),
                      child: Text(
                        'Exit',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void tapped(int index) {
    setState(() {
      if (xTurn && xOxTable[index] == '') {
        xOxTable[index] = 'x';
        tappedBoxes += 1;
        xTurn = !xTurn;
      } else if (!xTurn && xOxTable[index] == '') {
        xOxTable[index] = 'o';
        tappedBoxes += 1;
        xTurn = !xTurn;
      }

      winnerChecker();
    });
  }

  void winnerChecker() {
    if (xOxTable[0] == xOxTable[1] &&
        xOxTable[0] == xOxTable[2] &&
        xOxTable[0] != '') {
      return showWinner(xOxTable[0]);
    }

    if (xOxTable[3] == xOxTable[4] &&
        xOxTable[3] == xOxTable[5] &&
        xOxTable[3] != '') {
      return showWinner(xOxTable[3]);
    }

    if (xOxTable[6] == xOxTable[7] &&
        xOxTable[6] == xOxTable[8] &&
        xOxTable[6] != '') {
      return showWinner(xOxTable[6]);
    }

    if (xOxTable[0] == xOxTable[3] &&
        xOxTable[0] == xOxTable[6] &&
        xOxTable[0] != '') {
      return showWinner(xOxTable[0]);
    }

    if (xOxTable[1] == xOxTable[4] &&
        xOxTable[1] == xOxTable[7] &&
        xOxTable[1] != '') {
      return showWinner(xOxTable[1]);
    }
    if (xOxTable[2] == xOxTable[5] &&
        xOxTable[2] == xOxTable[8] &&
        xOxTable[2] != '') {
      return showWinner(xOxTable[2]);
    }
    if (xOxTable[6] == xOxTable[4] &&
        xOxTable[6] == xOxTable[2] &&
        xOxTable[6] != '') {
      return showWinner(xOxTable[6]);
    }

    if (xOxTable[0] == xOxTable[4] &&
        xOxTable[0] == xOxTable[8] &&
        xOxTable[0] != '') {
      return showWinner(xOxTable[0]);
    } else if (tappedBoxes == 9) {
      return showDraw();
    }
  }

  void showDraw() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('DRAW !!!\nOne point for each player'),
            actions: <Widget>[
              TextButton(
                child: Text('OK',
                    style: TextStyle(
                      color: Colors.black,
                    )),
                onPressed: () {
                  clearBoard();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
    oScore += 1;
    xScore += 1;
  }

  winnersaver() {
    if (oScore > xScore) {
      winnerHero = widget.Player2;
      winnerScore = oScore.toString();
      winnerXoX = 'O';
    } else if (xScore > oScore) {
      winnerScore = xScore.toString();
      winnerXoX = 'X';
      winnerHero = widget.Player1;
    } else if (oScore == xScore) {
      winnerScore = '${xScore.toString()} - ${oScore.toString()}';
      winnerXoX = 'DRAW';
      print('Draw');
    }
  }

  void exitDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure to exit?'),
            actions: <Widget>[
              TextButton(
                child: Text(
                  'Yes',
                  style: TextStyle(color: Colors.lightGreen),
                ),
                onPressed: () {
                  winnersaver();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => playerPanel(
                            iconholder: iconchanger,
                            winnerdisplay: winnerHero,
                            winnerXoX: winnerXoX,
                            scoreWinner: winnerScore,
                          )));
                },
              ),
              TextButton(
                child: Text(
                  'No',
                  style: TextStyle(color: Colors.lightGreen),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  void showWinner(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
                'Congratulations !!!\nPlayer:' + winner + ' won (+ 3 points)'),
            actions: <Widget>[
              TextButton(
                child: Text('Ok',
                    style: TextStyle(
                      color: Colors.black,
                    )),
                onPressed: () {
                  round += 1;
                  clearBoard();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });

    if (winner == 'x') {
      xScore += 3;
    } else if (winner == 'o') {
      oScore += 3;
    }
  }

  void resetGame() {
    setState(() {
      clearBoard();

      round = 1;
      xScore = 0;
      oScore = 0;
      xTurn = true;
    });
  }

  void clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        xTurn = true;
        xOxTable[i] = '';
      }
    });

    tappedBoxes = 0;
  }
}
