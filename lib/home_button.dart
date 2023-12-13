import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:zaliczenie_flutter/main.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({
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
                    child: MainScreen(), type: PageTransitionType.fade));
          },
          child: Icon(Icons.home_outlined)),
    );
  }
}
