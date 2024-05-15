import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Homepage extends StatefulWidget {
  String name;
  Homepage(this.name);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<String> boxes = ['', '', '', '', '', '', '', '', ''];
  int counter = 0;
  int userball = 0;
  int aiball = 0;
  String result = '';
  restart() {
    boxes = ['', '', '', '', '', '', '', '', ''];
    counter = 0;
    result = '';
    setState(() {});
  }

  newgame() {
    boxes = ['', '', '', '', '', '', '', '', ''];
    counter = 0;
    result = '';
    userball = 0;
    aiball = 0;
    setState(() {});
  }

  onPressed(int index) {
    if (boxes[index].isEmpty && result.isEmpty) {
      boxes[index] = '❌';
      counter++;
      result = checkWin();

      if (counter < 9 && result != "❌") {
        int randomnumber = Random().nextInt(9);
        while (boxes[randomnumber].isNotEmpty) {
          randomnumber = Random().nextInt(9);
        }
        boxes[randomnumber] = '⭕️';
        counter++;
        result = checkWin();
      }

      setState(() {});
      if (result.isNotEmpty) {
        if (result == '❌') {
          userball++;
        } else {
          aiball++;
        }
        if (boxes.length == 9) {
          result = 'duurrang';
        }

        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (ctx) {
              return AlertDialog(
                title: Text('${result == "❌" ?(result== widget.name ? 'AI': 'duurrang')} win'),
                actions: [
                  OutlinedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    label: Text('Okay'),
                    icon: Icon(Icons.thumb_up),
                  )
                ],
              );
            });
      }
    }
  }

  checkWin() {
    if (boxes[0] == '❌' && boxes[1] == '❌' && boxes[2] == '❌') {
      return '❌';
    } else if (boxes[3] == '❌' && boxes[4] == '❌' && boxes[5] == '❌') {
      return '❌';
    } else if (boxes[6] == '❌' && boxes[7] == '❌' && boxes[8] == '❌') {
      return '❌';
    } else if (boxes[0] == '❌' && boxes[3] == '❌' && boxes[6] == '❌') {
      return '❌';
    } else if (boxes[1] == '❌' && boxes[4] == '❌' && boxes[7] == '❌') {
      return '❌';
    } else if (boxes[2] == '❌' && boxes[5] == '❌' && boxes[8] == '❌') {
      return '❌';
    } else if (boxes[0] == '❌' && boxes[4] == '❌' && boxes[8] == '❌') {
      return '❌';
    } else if (boxes[2] == '❌' && boxes[4] == '❌' && boxes[6] == '❌') {
      return '❌';
    }
    if (boxes[0] == '⭕️' && boxes[1] == '⭕️' && boxes[2] == '⭕️') {
      return '⭕️';
    } else if (boxes[3] == '⭕️' && boxes[4] == '⭕️' && boxes[5] == '⭕️') {
      return '⭕️';
    } else if (boxes[6] == '⭕️' && boxes[7] == '⭕️' && boxes[8] == '⭕️') {
      return '⭕️';
    } else if (boxes[0] == '⭕️' && boxes[3] == '⭕️' && boxes[6] == '⭕️') {
      return '⭕️';
    } else if (boxes[1] == '⭕️' && boxes[4] == '⭕️' && boxes[2] == '⭕️') {
      return '⭕️';
    } else if (boxes[2] == '⭕️' && boxes[5] == '⭕️' && boxes[8] == '⭕️') {
      return '⭕️';
    } else if (boxes[0] == '⭕️' && boxes[4] == '⭕️' && boxes[8] == '⭕️') {
      return '⭕️';
    } else if (boxes[2] == '⭕️' && boxes[4] == '⭕️' && boxes[6] == '⭕️') {
      return '⭕️';
    }

    return "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange.shade200,
        title: const Text(
          'Oper Tic Tac Toe',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        color: Colors.orange.shade200,
        child: Column(
          children: [
            Text(
              '$userball : $aiball',
              style: const TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    onPressed(0);
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      border: Border(
                          right: BorderSide(color: Colors.black, width: 5),
                          bottom: BorderSide(color: Colors.black, width: 5)),
                    ),
                    child: Text(
                      boxes[0],
                      style: const TextStyle(fontSize: 50),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    onPressed(1);
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      border: Border(
                          right: BorderSide(color: Colors.black, width: 5),
                          bottom: BorderSide(color: Colors.black, width: 5)),
                    ),
                    child: Text(boxes[1], style: const TextStyle(fontSize: 50)),
                  ),
                ),
                InkWell(
                  onTap: () {
                    onPressed(2);
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.black, width: 5)),
                    ),
                    child: Text(boxes[2], style: TextStyle(fontSize: 50)),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    onPressed(3);
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      border: Border(
                          right: BorderSide(color: Colors.black, width: 5),
                          bottom: BorderSide(color: Colors.black, width: 5)),
                    ),
                    child: Text(boxes[3], style: const TextStyle(fontSize: 50)),
                  ),
                ),
                InkWell(
                  onTap: () {
                    onPressed(4);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      border: Border(
                          right: BorderSide(color: Colors.black, width: 5),
                          bottom: BorderSide(color: Colors.black, width: 5)),
                    ),
                    child: Text(boxes[4], style: const TextStyle(fontSize: 50)),
                  ),
                ),
                InkWell(
                  onTap: () {
                    onPressed(5);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.black, width: 5)),
                    ),
                    child: Text(boxes[5], style: const TextStyle(fontSize: 50)),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    onPressed(6);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(color: Colors.black, width: 5),
                      ),
                    ),
                    child: Text(boxes[6], style: const TextStyle(fontSize: 50)),
                  ),
                ),
                InkWell(
                  onTap: () {
                    onPressed(7);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(color: Colors.black, width: 5),
                      ),
                    ),
                    child: Text(boxes[7], style: TextStyle(fontSize: 50)),
                  ),
                ),
                InkWell(
                  onTap: () {
                    onPressed(8);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(),
                    child: Text(boxes[8], style: const TextStyle(fontSize: 50)),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    restart();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.all(20),
                      textStyle: const TextStyle(fontWeight: FontWeight.bold)),
                  child: const Text('NEW GAME')),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    newgame();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.all(20),
                      textStyle: const TextStyle(fontWeight: FontWeight.bold)),
                  child: const Text('Restart')),
            )
          ],
        ),
      ),
    );
  }
}
