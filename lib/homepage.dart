import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sayitahmin_flutter/constant.dart';
import 'package:sayitahmin_flutter/textbox.dart';

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
                  child: buildAnimationTitle(),
                ),
                buildTopSide(),
                buildAskText(),
                TextboxGuess(bittimi: bittimi,guessTextEdit:guessedNumber ,),
                buildButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding buildButton() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GestureDetector(
        child: Material(
          elevation: 30.0
          ,shape: CircleBorder(side: BorderSide(width: 3.0)),
          child: Container(

            width: bittimi ? 150.0 : 100.0,
            height: bittimi ? 150.0 : 100.0,
            decoration: new BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.pink,
                  blurRadius: 1.0, // has the effect of softening the shadow
                  spreadRadius: 2.0, // has the effect of extending the shadow

                )
              ],
              color: Colors.yellow.shade600,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: bittimi ?  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[

                  Text(
                    "Oyuna" ,
                    style: bottomButtonAgainTextStyle,
                  ),
                  Text(
                    " Tekrar Başla" ,
                    style:bottomButtonAgainTextStyle,
                  ),



                ],)
                  : Text(
                "Tahmin Et" ,
                style: bottomButtonTextStyle,
              ),
            ),
          ),
        ),
        onTap: guess,
      ),
    );
  }

  Padding buildTextBox() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: bittimi
          ? Text(
        "",
        style: textStyle,
      )
          : TextField(
          style: textStyle,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(30.0)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(30.0)),
              hintText: 'Bir sayı gir',
              hintStyle: hintStyle),
          keyboardType: TextInputType.number,
          inputFormatters: [
            WhitelistingTextInputFormatter.digitsOnly
          ],
          controller: guessedNumber),
    );
  }

  Align buildAskText() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: bittimi
                ? Text(" ")
                : Text(
              'Tahmin edebilir misin?',
              style: textStyle,
            ),
          ),
        ),
      ),
    );
  }

  Row buildTopSide() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Image(
                  image: AssetImage(imgUrl),
                  fit: BoxFit.cover,
                ),
              ),
            )),
        Expanded(
            flex: 1,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Text(
                      yazi,
                      style: pikachuTalkTextStyle,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Text(
                      bittimi
                          ? ""
                          : "Tahmin etmek için $numberOfTries hakkın var",
                      style:ruleText,
                    ),
                  ),
                ),
              ],
            )),
      ],
    );
  }

  SizedBox buildAnimationTitle() {
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
          alignment:
          AlignmentDirectional.topStart // or Alignment.topLeft
      ),
    );
  }

  void guess() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');

    if (isEmpty()) {
      if (bittimi == true) {
        imgUrl = "images/tahmin.png";
        yazi = "1 ile 100 arasında bir sayı tuttum. Hadi tahmin et!";
        bittimi = false;   setState(() {

        });
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
    }

    else {
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