import 'package:flutter/material.dart';
import 'package:sayitahmin_flutter/constant.dart';

class TextAsk extends StatelessWidget {
  final bool bittimi;

  TextAsk({this.bittimi});

  @override
  Widget build(BuildContext context) {
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
}
