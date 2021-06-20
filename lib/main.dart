import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() {
  runApp(Xylophone());
}

class Xylophone extends StatelessWidget {
  final audioPlayer = AudioPlayer();
  final keys = [
    {
      "color": Colors.red,
      "name": "C",
      "sound": 1,
    },
    {
      "color": Colors.orange,
      "name": "D",
      "sound": 2,
    },
    {
      "color": Colors.yellow,
      "name": "E",
      "sound": 3,
    },
    {
      "color": Colors.indigo,
      "name": "F",
      "sound": 4,
    },
    {
      "color": Colors.cyan,
      "name": "G",
      "sound": 5,
    },
    {
      "color": Colors.green.shade600,
      "name": "A",
      "sound": 6,
    },
    {
      "color": Colors.blue.shade800,
      "name": "B",
      "sound": 7,
    },
    {
      "color": Colors.purpleAccent,
      "name": "C",
      "sound": 8,
    },
  ];

  void playSound(dynamic keySoundClipNo) {
    audioPlayer.setAsset('assets/note$keySoundClipNo.wav');
    audioPlayer.play();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Align(
              alignment: Alignment.center,
              child: Text(
                'XYLOPHONE',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2,
                ),
              ),
            ),
          ),
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (var key in keys)
                    SoundKey(
                        keyColor: key["color"],
                        keySoundClipNo: key["sound"],
                        keyName: key["name"],
                        playSound: playSound),
                ],
              ),
            ),
          )),
    );
  }
}

class SoundKey extends StatelessWidget {
  final keyColor;
  final keySoundClipNo;
  final keyName;
  final Function playSound;

  const SoundKey({
    required this.keyColor,
    required this.keySoundClipNo,
    required this.keyName,
    required this.playSound,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          playSound(keySoundClipNo);
        },
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(right: 8),
            // key name
            child: Align(
              alignment: Alignment.centerRight,
              child: RotatedBox(
                quarterTurns: 1,
                child: Text(
                  keyName,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          margin: EdgeInsets.symmetric(
              horizontal: keySoundClipNo * 12.0, vertical: 5),
          decoration: BoxDecoration(
            color: keyColor,
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
        ),
      ),
    );
  }
}
