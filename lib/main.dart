import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:english_words/english_words.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

//screen import
import 'home_button.dart';
import 'how_to_play_button.dart';
import 'play_again_button.dart';
import 'screen_lost.dart';

var concatenate = StringBuffer();
var colorFirstLetter = Color.fromARGB(255, 254, 93, 38);
var colorTextRestText = Colors.black;
var weightOfFont = (FontWeight.bold);
int lives = 18;

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
          scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 254, 93, 38),
                  foregroundColor: Colors.black,
                  //fixedSize: Size(150, 30),
                  textStyle: TextStyle(
                    fontWeight: weightOfFont,
                  ))),
        ),
        home: MainScreen(),
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
    int livesLeft = lives - wrongLetters.length;

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
            padding: const EdgeInsets.all(5),
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
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 10,
            ),
            child: Text(
              resultList.join(' '),
              style: TextStyle(
                fontSize: 30,
                fontWeight: weightOfFont,
              ),
            ),
          ),
          hangmanImage(livesLeft),
          Padding(
            padding: const EdgeInsets.all(25),
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
                                  child: ScreenLost(),
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
                        int scoreGame = lives - wrongLetters.length;
                        if (scoreGame > appState.hiScores) {
                          appState.hiScores = scoreGame;
                        }
                        Navigator.push(
                            context,
                            PageTransition(
                                child: ScreenWon(),
                                type: PageTransitionType.fade));
                      }
                    }

                    lettersChosenEarlier.add(newValue);
                    checkingCode();
                  });
                }),
          ),
          HomeButton(),
        ]),
      ),
    );
  }

  Widget hangmanImage(int livesLeft) {
    switch (livesLeft) {
      case 1:
        return Image.asset(
          'assets/part17.png',
          height: 300,
        );
      case 2:
        return Image.asset(
          'assets/part16.png',
          height: 300,
        );
      case 3:
        return Image.asset(
          'assets/part15.png',
          height: 300,
        );
      case 4:
        return Image.asset(
          'assets/part14.png',
          height: 300,
        );
      case 5:
        return Image.asset(
          'assets/part13.png',
          height: 300,
        );
      case 6:
        return Image.asset(
          'assets/part12.png',
          height: 300,
        );
      case 7:
        return Image.asset(
          'assets/part11.png',
          height: 300,
        );
      case 8:
        return Image.asset(
          'assets/part10.png',
          height: 300,
        );
      case 9:
        return Image.asset(
          'assets/part9.png',
          height: 300,
        );
      case 10:
        return Image.asset(
          'assets/part8.png',
          height: 300,
        );
      case 11:
        return Image.asset(
          'assets/part7.png',
          height: 300,
        );
      case 12:
        return Image.asset(
          'assets/part6.png',
          height: 300,
        );
      case 13:
        return Image.asset(
          'assets/part5.png',
          height: 300,
        );
      case 14:
        return Image.asset(
          'assets/part4.png',
          height: 300,
        );
      case 15:
        return Image.asset(
          'assets/part3.png',
          height: 300,
        );
      case 16:
        return Image.asset(
          'assets/part2.png',
          height: 300,
        );
      case 17:
        return Image.asset(
          'assets/part1.png',
          height: 300,
        );
      case 18:
        return SizedBox(
          height: 300,
        );
      default:
        null;
    }
    return SizedBox(
      height: 0,
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

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
            HowToPlayButton(),
          ],
        ),
      ),
    );
  }
}

class ScreenWon extends StatefulWidget {
  ScreenWon({super.key});

  @override
  State<ScreenWon> createState() => _ScreenWonState();
}

class _ScreenWonState extends State<ScreenWon> {
  int? readScore;

  @override
  void initState() {
    super.initState();
    loadScore('hiScore');
  }

  void saveScore(String key, int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  }

  Future<void> loadScore(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      readScore = prefs.getInt(key) ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<StateOfApp>();
    List wordsWon = ['WYGRANA', 'ZWYCIĘSTWO', 'SUKCES'];
    int wordsWonInt = Random().nextInt(3);
    var wordWon = wordsWon[wordsWonInt];
    var scoreEnd = lives - appState.wrongLetters.length;
    List wordWonList = wordWon.split('');
    var firstLetter = wordWonList.first.toString();
    wordWonList.removeAt(0);
    var restOfWord = wordWonList.join('').toString();
    try {
      if (scoreEnd > readScore!) {
        saveScore('hiScore', (lives - appState.wrongLetters.length));
        print(scoreEnd);
      }
    } on TypeError {
      print('typeerror');
    }
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
              scoreEnd.toString(),
              style: TextStyle(
                fontWeight: weightOfFont,
                fontSize: 36,
              ),
            ),
            Text('Najwyższy wynik:'),
            Text('$readScore'),
            SizedBox(
              height: 350,
            ),
            PlayAgainButton(appState: appState),
            HomeButton(),
          ],
        ),
      ),
    );
  }
}
