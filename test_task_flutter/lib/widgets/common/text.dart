import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final padding;
  final lable;
  final alignment;
  final textStyle;

  MyText({
    Key? key,
    this.lable,
    this.alignment = Alignment.topLeft,
    this.textStyle = TextStyle,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        child: Align(
          alignment: alignment,
          child: Text(
            '$lable',
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
