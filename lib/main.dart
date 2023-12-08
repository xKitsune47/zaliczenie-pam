import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:english_words/english_words.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kumi_popup_window/kumi_popup_window.dart';
import 'package:page_transition/page_transition.dart';

var concatenate = StringBuffer();
var colorFirstLetter = Color.fromARGB(255, 254, 93, 38);
var colorTextRestText = Colors.black;
var weightOfFont = (FontWeight.bold);
int lives = 20;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StateOfApp(),
      child: MaterialApp(
        title: 'Wisielec',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme:
              ColorScheme.fromSeed(seedColor: Color.fromARGB(0, 49, 169, 131)),
          textTheme: GoogleFonts.josefinSansTextTheme(),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 254, 93, 38),
                  foregroundColor: Colors.black,
                  fixedSize: Size(150, 30),
                  textStyle: TextStyle(
                    fontWeight: weightOfFont,
                  ))),
        ),
        home: mainScreen(),
      ),
    );
  }
}

class StateOfApp extends ChangeNotifier {
  var randomizedWordNumber = 1;
  List randomizedWords = [];
  List resultList = [];
  List lettersChosenEarlier = [];
  List wrongLetters = [];
  var hiScores = 0;

  generateNoun() {
    if (randomizedWords.length <= 2000) {
      nouns.take(200).forEach((element) {
        if (element.length <= 8) {
          randomizedWords.add((element.toString()).toLowerCase());
        }
      });
    }
  }

  wordGeneration() {
    randomizedWordNumber = Random().nextInt(randomizedWords.length - 1);
    resultList.clear();
    lettersChosenEarlier.clear();
    wrongLetters.clear();
    notifyListeners();
  }
}

class GameScreenStateful extends StatefulWidget {
  const GameScreenStateful({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _GameScreenStateful createState() => _GameScreenStateful();
}

class _GameScreenStateful extends State<GameScreenStateful> {
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final textTheme = Theme.of(context).textTheme;
    var appState = context.watch<StateOfApp>();
    var selectedValue = 'Wybierz literę';
    var randomizedWordNumber = appState.randomizedWordNumber;
    var word = appState.randomizedWords[randomizedWordNumber];
    List wordSplit = word.split('');
    var resultList = appState.resultList;
    var lettersChosenEarlier = appState.lettersChosenEarlier;
    List wrongLetters = appState.wrongLetters;
    if ((resultList.length + 1) <= wordSplit.length) {
      for (var i = 0; i < wordSplit.length; i++) {
        resultList.add(' _ ');
      }
    }

    return Scaffold(
      body: Center(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Text.rich(TextSpan(children: [
              TextSpan(
                  text: "A",
                  style: TextStyle(
                      color: colorFirstLetter,
                      fontWeight: weightOfFont,
                      fontSize: 36)),
              TextSpan(
                  text: "ktualny ",
                  style: TextStyle(
                      color: colorTextRestText,
                      fontWeight: weightOfFont,
                      fontSize: 36)),
              TextSpan(
                  text: "W",
                  style: TextStyle(
                      color: colorFirstLetter,
                      fontWeight: weightOfFont,
                      fontSize: 36)),
              TextSpan(
                  text: "ynik",
                  style: TextStyle(
                    color: colorTextRestText,
                    fontWeight: weightOfFont,
                    fontSize: 36,
                  )),
            ])),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0, bottom: 100),
            child: Text(
              (lives - wrongLetters.length).toString(),
              style: TextStyle(
                fontWeight: weightOfFont,
                fontSize: 36,
                color: colorTextRestText,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Text(
              resultList.join(' '),
              style: TextStyle(
                fontSize: 30,
                fontWeight: weightOfFont,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200, bottom: 50),
            child: DropdownButton(
                value: selectedValue,
                items: [
                  DropdownMenuItem(
                      value: 'Wybierz literę', child: Text('Wybierz literę')),
                  if (!lettersChosenEarlier.contains('a'))
                    DropdownMenuItem(value: 'a', child: Text('a')),
                  if (!lettersChosenEarlier.contains('b'))
                    DropdownMenuItem(value: 'b', child: Text('b')),
                  if (!lettersChosenEarlier.contains('c'))
                    DropdownMenuItem(value: 'c', child: Text('c')),
                  if (!lettersChosenEarlier.contains('d'))
                    DropdownMenuItem(value: 'd', child: Text('d')),
                  if (!lettersChosenEarlier.contains('e'))
                    DropdownMenuItem(value: 'e', child: Text('e')),
                  if (!lettersChosenEarlier.contains('f'))
                    DropdownMenuItem(value: 'f', child: Text('f')),
                  if (!lettersChosenEarlier.contains('g'))
                    DropdownMenuItem(value: 'g', child: Text('g')),
                  if (!lettersChosenEarlier.contains('h'))
                    DropdownMenuItem(value: 'h', child: Text('h')),
                  if (!lettersChosenEarlier.contains('i'))
                    DropdownMenuItem(value: 'i', child: Text('i')),
                  if (!lettersChosenEarlier.contains('j'))
                    DropdownMenuItem(value: 'j', child: Text('j')),
                  if (!lettersChosenEarlier.contains('k'))
                    DropdownMenuItem(value: 'k', child: Text('k')),
                  if (!lettersChosenEarlier.contains('l'))
                    DropdownMenuItem(value: 'l', child: Text('l')),
                  if (!lettersChosenEarlier.contains('m'))
                    DropdownMenuItem(value: 'm', child: Text('m')),
                  if (!lettersChosenEarlier.contains('n'))
                    DropdownMenuItem(value: 'n', child: Text('n')),
                  if (!lettersChosenEarlier.contains('o'))
                    DropdownMenuItem(value: 'o', child: Text('o')),
                  if (!lettersChosenEarlier.contains('p'))
                    DropdownMenuItem(value: 'p', child: Text('p')),
                  if (!lettersChosenEarlier.contains('q'))
                    DropdownMenuItem(value: 'q', child: Text('q')),
                  if (!lettersChosenEarlier.contains('r'))
                    DropdownMenuItem(value: 'r', child: Text('r')),
                  if (!lettersChosenEarlier.contains('s'))
                    DropdownMenuItem(value: 's', child: Text('s')),
                  if (!lettersChosenEarlier.contains('t'))
                    DropdownMenuItem(value: 't', child: Text('t')),
                  if (!lettersChosenEarlier.contains('u'))
                    DropdownMenuItem(value: 'u', child: Text('u')),
                  if (!lettersChosenEarlier.contains('v'))
                    DropdownMenuItem(value: 'v', child: Text('v')),
                  if (!lettersChosenEarlier.contains('w'))
                    DropdownMenuItem(value: 'w', child: Text('w')),
                  if (!lettersChosenEarlier.contains('x'))
                    DropdownMenuItem(value: 'x', child: Text('x')),
                  if (!lettersChosenEarlier.contains('y'))
                    DropdownMenuItem(value: 'y', child: Text('y')),
                  if (!lettersChosenEarlier.contains('z'))
                    DropdownMenuItem(value: 'z', child: Text('z')),
                ],
                icon: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Icon(Icons.arrow_drop_down_rounded)),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValue = newValue!;
                    checkingCode() {
                      var iterator = 0;
                      if (wordSplit.contains(newValue)) {
                        for (var letter in wordSplit) {
                          if (letter == newValue) {
                            resultList.insert(iterator, letter);
                            resultList.removeAt(iterator + 1);
                          }
                          iterator = iterator + 1;
                        }
                      } else {
                        if (wrongLetters.contains(newValue)) {
                        } else {
                          wrongLetters.add(newValue);
                        }
                        if ((lives - wrongLetters.length) <= 0) {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: screenLost(),
                                  type: PageTransitionType.fade));
                        }
                      }
                      List completionCheckList1 = resultList;
                      List completionCheckList2 = [];
                      for (var element in completionCheckList1) {
                        if (element != ' ') {
                          completionCheckList2.add(element);
                        }
                      }
                      if (completionCheckList2.join('') == word) {
                        int score = lives - wrongLetters.length;
                        if (score > appState.hiScores) {
                          appState.hiScores = score;
                        }
                        Navigator.push(
                            context,
                            PageTransition(
                                child: screenWon(),
                                type: PageTransitionType.fade));
                      }
                    }

                    lettersChosenEarlier.add(newValue);
                    checkingCode();
                  });
                }),
          ),
          homeButton(),
        ]),
      ),
    );
  }
}

class mainScreen extends StatelessWidget {
  const mainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<StateOfApp>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: "W",
                  style: TextStyle(
                      color: colorFirstLetter,
                      fontWeight: weightOfFont,
                      fontSize: 40)),
              TextSpan(
                  text: "ISIE",
                  style: TextStyle(
                      color: colorTextRestText,
                      fontWeight: weightOfFont,
                      fontSize: 40)),
              TextSpan(
                  text: "L",
                  style: TextStyle(
                      color: colorFirstLetter,
                      fontWeight: weightOfFont,
                      fontSize: 40)),
              TextSpan(
                  text: "EC",
                  style: TextStyle(
                      color: colorTextRestText,
                      fontWeight: weightOfFont,
                      fontSize: 40)),
            ])),
            SizedBox(
              height: 250,
            ),
            ElevatedButton(
              child: const Icon(Icons.play_arrow_rounded),
              onPressed: () {
                appState.generateNoun();
                appState.wordGeneration();
                Navigator.push(
                    context,
                    PageTransition(
                        child: GameScreenStateful(),
                        type: PageTransitionType.fade));
              },
            ),
            howToPlayButton(),
          ],
        ),
      ),
    );
  }
}

class howToPlayButton extends StatelessWidget {
  const howToPlayButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        child: const Icon(Icons.question_mark_rounded),
        onPressed: () {
          showPopupWindow(
            context,
            gravity: KumiPopupGravity.center,
            bgColor: Colors.grey.withOpacity(0.5),
            clickOutDismiss: true,
            clickBackDismiss: true,
            customAnimation: false,
            customPop: false,
            customPage: false,
            underStatusBar: false,
            underAppBar: true,
            offsetX: 0,
            offsetY: 0,
            duration: Duration(milliseconds: 200),
            onShowStart: (pop) {
              print("showStart");
            },
            onShowFinish: (pop) {
              print("showFinish");
            },
            onDismissStart: (pop) {
              print("dismissStart");
            },
            onDismissFinish: (pop) {
              print("dismissFinish");
            },
            onClickOut: (pop) {
              print("onClickOut");
            },
            onClickBack: (pop) {
              print("onClickBack");
            },
            childFun: (pop) {
              return Container(
                key: GlobalKey(),
                padding: EdgeInsets.all(10),
                height: 250,
                width: 200,
                color: Color.fromARGB(255, 254, 93, 38),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                          'W tej grze chodzi o zgadnięcie wszystkich liter w wylosowanym po angielsku słowie. Masz na to maksymalnie 20 prób.'),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text('Powodzenia!'),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class screenLost extends StatelessWidget {
  screenLost({super.key});

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
              height: 350,
            ),
            playAgainButton(appState: appState),
            homeButton(),
          ],
        ),
      ),
    );
  }
}

class screenWon extends StatelessWidget {
  screenWon({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<StateOfApp>();
    List wordsWon = ['WYGRANA', 'ZWYCIĘSTWO', 'SUKCES'];
    int wordsWonInt = Random().nextInt(3);
    var wordWon = wordsWon[wordsWonInt];
    var score = lives - appState.wrongLetters.length;
    List wordWonList = wordWon.split('');
    var firstLetter = wordWonList.first.toString();
    wordWonList.removeAt(0);
    var restOfWord = wordWonList.join('').toString();
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
            Text('WYNIK TO:'),
            Text(
              score.toString(),
              style: TextStyle(
                fontWeight: weightOfFont,
                fontSize: 36,
              ),
            ),
            Text('Najwyższy wynik: ${appState.hiScores}'),
            SizedBox(
              height: 350,
            ),
            playAgainButton(appState: appState),
            homeButton(),
          ],
        ),
      ),
    );
  }
}

class playAgainButton extends StatelessWidget {
  const playAgainButton({
    super.key,
    required this.appState,
  });

  final StateOfApp appState;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        child: const Icon(Icons.replay_rounded),
        onPressed: () {
          appState.wordGeneration();
          Navigator.push(
              context,
              PageTransition(
                  child: GameScreenStateful(), type: PageTransitionType.fade));
        },
      ),
    );
  }
}

class homeButton extends StatelessWidget {
  const homeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                PageTransition(
                    child: mainScreen(), type: PageTransitionType.fade));
          },
          child: Icon(Icons.home_outlined)),
    );
  }
}
