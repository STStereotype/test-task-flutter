import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final func;
  final width;
  final height;
  final lable;
  final String nickName;
  final String password;

  MyButton({
    Key? key,
    this.func,
    this.width,
    this.height,
    this.lable,
    required this.nickName,
    required this.password,
  }) : super(key: key);

  _func() {
    if (password != '' && nickName != '')
      return func;
    else
      return null;
  }

  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFD04961),
            Color(0xFFE5434B),
          ],
        ),
      ),
      // ignore: deprecated_member_use
      child: RaisedButton(
        color: Colors.transparent,
        child: Text(
          '$lable',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        onPressed: _func(),
      ),
    );
  }
}
