import 'package:flutter/material.dart';
import 'package:sayitahmin_flutter/constant.dart';

class Button extends StatelessWidget {
  final bool bittimi;
  final Function onTap;

  Button({this.bittimi, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GestureDetector(
        child: Material(
          elevation: 30.0,
          shape: CircleBorder(side: BorderSide(width: 3.0)),
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
              child: bittimi
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Oyuna",
                          style: bottomButtonAgainTextStyle,
                        ),
                        Text(
                          " Tekrar Başla",
                          style: bottomButtonAgainTextStyle,
                        ),
                      ],
                    )
                  : Text(
                      "Tahmin Et",
                      style: bottomButtonTextStyle,
                    ),
            ),
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
