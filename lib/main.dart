import 'package:flutter/material.dart';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'KP MUSIC',
            style: TextStyle(
              fontSize: 40,
              fontFamily: 'AmaticSC',
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.black54,
        ),
        body: Musicapp(),
      ),
    ),
  );
}

class Musicapp extends StatefulWidget {
  const Musicapp({Key? key}) : super(key: key);

  @override
  State<Musicapp> createState() => _MusicappState();
}

class _MusicappState extends State<Musicapp> {
  int number = 1;
  final player = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/wp.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$number/6',
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'AmaticSC',
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    setState(
                      () {
                        if (number != 1) {
                          number = number - 1;
                        }
                      },
                    );
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    player.play(
                      AssetSource("$number.mp3"),
                    );
                  },
                  child: Image.asset(
                    'images/$number.jpg',
                    width: 250,
                    height: 300,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(
                      () {
                        if (number != 6) {
                          number = number + 1;
                        }
                      },
                    );
                  },
                  child: Icon(
                    Icons.arrow_forward,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    player.play(
                      AssetSource("$number.mp3"),
                    );
                  },
                  child: Text(
                    'Play',
                    style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'AmaticSC',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    player.stop();
                  },
                  child: Text(
                    'Stop',
                    style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'AmaticSC',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    player.pause();
                  },
                  child: Text(
                    'Pause',
                    style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'AmaticSC',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(
                      () {
                        number = Random().nextInt(6) + 1;
                      },
                    );
                  },
                  child: Text(
                    'Shuffle',
                    style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'AmaticSC',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
            //SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
