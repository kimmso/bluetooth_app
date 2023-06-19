import 'package:flutter/material.dart';

void main() {
  runApp(BaseballCountApp());
}

class BaseballCountApp extends StatefulWidget {
  @override
  _BaseballCountAppState createState() => _BaseballCountAppState();
}

class _BaseballCountAppState extends State<BaseballCountApp> {
  int S = 0;
  int B = 0;
  int O = 0;

  void resetCount() {
    setState(() {
      S = 0;
      B = 0;
      O = 0;
    });
  }

  void increaseOutCount() {
    setState(() {
      O++;
      if (O == 3) {
        resetCount();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Bluetooth countboard'),
          centerTitle: true,
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
          elevation: 0.0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'B',
                  style: TextStyle(fontSize: 24),
                ),
                for (int i = 0; i < B && i < 3; i++)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                    ),
                  ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'S',
                  style: TextStyle(fontSize: 24),
                ),
                for (int i = 0; i < S && i < 2; i++)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.yellow,
                      ),
                    ),
                  ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'O',
                  style: TextStyle(fontSize: 24),
                ),
                for (int i = 0; i < O && i < 2; i++)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      S++;
                      if (S == 3) {
                        increaseOutCount();
                      }
                      if (S == 3 && B == 4) {
                        resetCount();
                      }
                    });
                  },
                  child: Text('Strike'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (B < 3) {
                        B++;
                        if (B == 4) {
                          resetCount();
                        }
                        if (S == 3 && B == 4) {
                          resetCount();
                        }
                      }
                    });
                  },
                  child: Text('Ball'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (O < 3) {
                        O++;
                        if (O == 3) {
                          resetCount();
                        }
                      }
                    });
                  },
                  child: Text('Out'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
