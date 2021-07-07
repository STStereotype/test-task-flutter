import 'package:flutter/material.dart';
import 'package:test_task_flutter/Pages/login_page.dart';
import 'package:test_task_flutter/widgets/common/text.dart';

class MyNews extends StatelessWidget {
  _news() {
    // ignore: dead_code
    if (false) {
      return () {}; // заглушка для загрузки новостей.
    } else {
      return Container(
        padding: EdgeInsets.only(top: height * 0.38),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          MyText(
            lable: 'News',
            padding: EdgeInsets.only(
              top: height * 0.08,
              left: width * 0.14,
              right: width * 0.045,
            ),
            alignment: Alignment.topLeft,
            textStyle: TextStyle(
              fontSize: 22,
              fontFamily: 'Roboto',
              color: Colors.black,
            ),
          ),
          _news(),
          Container(),
        ],
      ),
    );
  }
}
