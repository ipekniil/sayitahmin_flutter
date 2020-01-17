import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sayitahmin_flutter/animationtitle.dart';
import 'package:sayitahmin_flutter/asktext.dart';
import 'package:sayitahmin_flutter/button.dart';
import 'package:sayitahmin_flutter/textbox.dart';
import 'package:sayitahmin_flutter/topside.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  bool bittimi = false;
  String imgUrl = "images/tahmin.png";
  String yazi = "1 ile 100 arasında bir sayı tuttum. Hadi tahmin et!";

  int numberOfTries = 10;
  int numberOfTimes = 0;

  final guessedNumber = new TextEditingController();

  static Random ran = new Random();
  int randomNumber = ran.nextInt(100) + 1;

  @override
  Widget build(BuildContext context) {
    var ulBorder = UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.pink),
    );

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          color: Colors.black,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: TitleAnimation(),
                ),
                TopSideRow(
                  bittimi: bittimi,
                  imgUrl: imgUrl,
                  numberOfTries: numberOfTries,
                  yazi: yazi,
                ),
                TextAsk(
                  bittimi: bittimi,
                ),
                TextboxGuess(
                  bittimi: bittimi,
                  guessTextEdit: guessedNumber,
                ),
                Button(
                  bittimi: bittimi,
                  onTap: () {
                    guess();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void guess() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');

    if (isEmpty()) {
      if (bittimi == true) {
        imgUrl = "images/tahmin.png";
        yazi = "1 ile 100 arasında bir sayı tuttum. Hadi tahmin et!";
        bittimi = false;
        setState(() {});
      } else {
        setState(() {
          yazi = "Boş girme lütfen";
        });
      }

      return;
    }

    int guess = int.parse(guessedNumber.text);

    if (guess > 100 || guess < 1) {
      setState(() {
        yazi = "Lütfen 1 ile 100 arasında bir sayı gir.";
      });
      guessedNumber.clear();
      return;
    }

    numberOfTries--;
    if (numberOfTries == numberOfTimes && guess != randomNumber) {
      numberOfTries = 10;

      guessedNumber.clear();
      setState(() {
        yazi =
            "Benim tuttuğum sayı: $randomNumber Malesef bulamadın. Bir daha denemek ister misin? ";
        bittimi = true;
        randomNumber = ran.nextInt(100) + 1;
      });

      return;
    } else {
      if (guess > randomNumber) {
        setState(() {
          imgUrl = "images/sinirli.png";

          yazi = "Mmmmmm biraz daha azaltttt!";
        });
      } else if (guess < randomNumber) {
        setState(() {
          imgUrl = "images/sinirli.png";
          yazi = "Mmmmmm biraz daha yükselttttt!";
        });
      } else {
        setState(() {
          imgUrl = "images/succes.png";
          yazi = "Oleyy! Doğru tahmin! Sayı: $randomNumber";
          bittimi = true;
        });
        numberOfTries = 10;
        randomNumber = ran.nextInt(100) + 1;
      }

      guessedNumber.clear();
    }
  }

  bool isEmpty() {
    return guessedNumber.text.isEmpty;
  }
}
