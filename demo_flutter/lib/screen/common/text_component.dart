import 'package:flutter/material.dart';

class TextBlack16 extends StatelessWidget {
  const TextBlack16({
    Key? key,
    this.text,
    this.maxLine = 1,
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);

  final String? text;
  final int maxLine;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 16,
        color: Colors.black,
        fontWeight: fontWeight,
        decoration: TextDecoration.none,
      ),
      textAlign: TextAlign.center,
      maxLines: maxLine,
    );
  }
}
