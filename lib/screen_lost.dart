import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zaliczenie_flutter/main.dart';

import 'home_button.dart';
import 'play_again_button.dart';

class ScreenLost extends StatelessWidget {
  ScreenLost({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<StateOfApp>();
    List wordsLost = ['PRZEGRANA', 'PORAŻKA', 'NIEPOWODZENIE'];
    int wordsLostInt = Random().nextInt(3);
    var wordLost = wordsLost[wordsLostInt];
    List wordLostList = wordLost.split('');
    var firstLetter = wordLostList.first.toString();
    wordLostList.removeAt(0);
    var restOfWord = wordLostList.join('').toString();
    var unguessedWord = appState.randomizedWords[appState.randomizedWordNumber];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: [
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: firstLetter,
                  style: TextStyle(
                    color: colorFirstLetter,
                    fontWeight: weightOfFont,
                    fontSize: 36,
                  )),
              TextSpan(
                  text: restOfWord,
                  style: TextStyle(
                    fontWeight: weightOfFont,
                    fontSize: 36,
                  )),
            ])),
            Text(
              ':(',
              style: TextStyle(
                fontWeight: weightOfFont,
                fontSize: 36,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text('Słowo do odgadnięcia:'),
            Text(unguessedWord),
            SizedBox(
              height: 50,
            ),
            Image.asset(
              'assets/resized-depression-sad.gif',
              height: 150,
            ),
            SizedBox(
              height: 50,
            ),
            PlayAgainButton(appState: appState),
            HomeButton(),
          ],
        ),
      ),
    );
  }
}
