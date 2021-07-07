import 'package:test_task_flutter/Widgets/Login_widgets/input.dart';
import 'package:test_task_flutter/Widgets/Login_widgets/my_buttin.dart';
import 'package:test_task_flutter/validation/authorization.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:test_task_flutter/widgets/common/text.dart';

double width = 0;
double height = 0;

class BackgroundSignIn extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..shader = ui.Gradient.linear(
        Offset(0, 0),
        Offset(width, 0),
        <Color>[
          Color(0xFFD04961),
          Color(0xFFE5434B),
        ],
      );
    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, width, height));
    canvas.drawPath(mainBackground, paint);
    //blue
    Path path = Path()
      ..addRRect(RRect.fromRectAndCorners(
          Rect.fromCenter(
              center: Offset(width / 2, height / 2),
              width: width * 0.9,
              height: height * 0.57),
          topLeft: Radius.circular(60),
          bottomRight: Radius.circular(60)))
      ..close();
    var paint2 = Paint();
    paint2.color = Colors.white;
    canvas.drawPath(path, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AuthorizationService _authorizationService = AuthorizationService();
  TextEditingController _nickNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _buttonAction() {
    if (_authorizationService.signInWithNicknameAndPassword(
        _nickNameController.text, _passwordController.text)) {
      _nickNameController.clear();
      _passwordController.clear();
      Navigator.pushNamed(context, '/home_page');
    }
  }

  _loginText() {
    return MyText(
      lable: 'Login',
      padding: EdgeInsets.only(
        top: height * 0.075,
        left: width * 0.045,
        right: width * 0.045,
      ),
      alignment: Alignment.topLeft,
      textStyle: TextStyle(
        fontSize: 22,
        fontFamily: 'Roboto',
        color: Colors.white,
      ),
    );
  }

  _form() {
    return Column(
      children: <Widget>[
        MyText(
          lable: 'Authorization',
          padding: EdgeInsets.only(
            top: height * 0.08,
            left: width * 0.045,
            right: width * 0.045,
          ),
          alignment: Alignment.topLeft,
          textStyle: TextStyle(
            fontSize: 16,
            fontFamily: 'Roboto',
            color: Colors.black38,
          ),
        ),
        AuthorizationTextField(
          padding: EdgeInsets.only(
            top: height * 0.065,
            left: width * 0.125,
            right: width * 0.125,
          ),
          label: 'NickName',
          controller: _nickNameController,
          inputFormatter: '[a-zA-Z0-9\\_]',
        ),
        AuthorizationTextField(
          padding: EdgeInsets.only(
            left: width * 0.125,
            right: width * 0.125,
            top: height * 0.025,
          ),
          label: 'Password',
          isPassword: true,
          controller: _passwordController,
          inputFormatter: '',
        ),
        SizedBox(
          height: height * 0.0677,
        ),
        MyButton(
          height: height * 0.08,
          width: width * 0.75,
          func: _buttonAction,
          lable: 'Sign in',
          nickName: _nickNameController.text,
          password: _passwordController.text,
        ),
        SizedBox(
          height: height * 0.046,
        ),
        MyText(
          lable: 'Регистрируясь, вы принимаете условия:',
          padding: EdgeInsets.only(
            left: width * 0.125,
            right: width * 0.125,
          ),
          alignment: Alignment.topLeft,
          textStyle: TextStyle(
            fontSize: 14,
            fontFamily: 'Roboto',
            color: Colors.black,
          ),
        ),
        MyText(
          lable: 'политику использования данных:',
          padding: EdgeInsets.only(
            top: width * 0.025,
            left: width * 0.125,
            right: width * 0.125,
          ),
          alignment: Alignment.topLeft,
          textStyle: TextStyle(
            decoration: TextDecoration.underline,
            fontSize: 14,
            fontFamily: 'Roboto',
            color: Colors.blue.shade900,
          ),
        ),
        MyText(
          lable: 'полититику в отношении файлов cookie:',
          padding: EdgeInsets.only(
            top: width * 0.005,
            left: width * 0.125,
            right: width * 0.125,
          ),
          alignment: Alignment.topLeft,
          textStyle: TextStyle(
            decoration: TextDecoration.underline,
            fontSize: 14,
            fontFamily: 'Roboto',
            color: Colors.blue.shade900,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CustomPaint(
        painter: BackgroundSignIn(),
        child: Column(
          children: <Widget>[
            _loginText(),
            _form(),
          ],
        ),
      ),
    );
  }
}
