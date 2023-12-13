import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:zaliczenie_flutter/main.dart';

class PlayAgainButton extends StatelessWidget {
  const PlayAgainButton({
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
