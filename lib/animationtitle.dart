import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:sayitahmin_flutter/constant.dart';

class TitleAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ColorizeAnimatedTextKit(
          onTap: () {
            print("Tap Event");
          },
          text: [
            "PIKACHU TAHMİN",
            "PIKACHU TAHMİN",
          ],
          textStyle: animationTitle,
          colors: [
            Colors.yellow.shade600,
            Colors.white,
            Colors.pink,
            Colors.black,
          ],
          textAlign: TextAlign.start,
          alignment: AlignmentDirectional.topStart // or Alignment.topLeft
          ),
    );
  }
}
