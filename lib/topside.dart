import 'package:flutter/material.dart';
import 'package:sayitahmin_flutter/constant.dart';

class TopSideRow extends StatelessWidget {
  final String imgUrl;
  final String yazi;
  final bool bittimi;
  final int numberOfTries;

  TopSideRow({this.bittimi, this.yazi, this.imgUrl, this.numberOfTries});

  @override
  Widget build(BuildContext context) {
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
                      style: ruleText,
                    ),
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
