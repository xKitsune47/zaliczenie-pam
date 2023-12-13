import 'package:flutter/material.dart';
import 'package:kumi_popup_window/kumi_popup_window.dart';

class HowToPlayButton extends StatelessWidget {
  const HowToPlayButton({
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
            bgColor: Colors.grey.withOpacity(0.7),
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
                          'W tej grze chodzi o odgadnięcie wszystkich liter w wylosowanym po angielsku słowie. Masz na to maksymalnie 20 prób.'),
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
