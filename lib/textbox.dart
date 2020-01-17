import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sayitahmin_flutter/constant.dart';

class TextboxGuess extends StatelessWidget {
  final bool bittimi;
  final TextEditingController guessTextEdit;

  TextboxGuess({this.bittimi, this.guessTextEdit});

  @override
  Widget build(BuildContext context) {
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
              inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
              controller: guessTextEdit),
    );
  }
}
