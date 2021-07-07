import 'package:test_task_flutter/Pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:test_task_flutter/Widgets/home%20page/buttom%20avigation%20bar%20item/my_apple.dart';
import 'dart:ui' as ui;

import 'package:test_task_flutter/Widgets/home%20page/buttom%20avigation%20bar%20item/my_news.dart';
import 'package:test_task_flutter/Widgets/home%20page/buttom%20avigation%20bar%20item/my_notes.dart';
import 'package:test_task_flutter/Widgets/home%20page/buttom%20avigation%20bar%20item/my_shells.dart';
import 'package:test_task_flutter/Widgets/home%20page/buttom%20avigation%20bar%20item/my_users.dart';

class BackgroundHomePage extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.white;
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
    paint.color = Colors.grey;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  Widget _myContacts = MyNews();
  Widget _myApple = MyApple();
  Widget _myUser = MyUser();
  Widget _myShells = MyShells();
  Widget _myNotes = MyNotes();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: this.getBody(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: this.selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.format_align_justify),
            label: "News",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "",
          )
        ],
        onTap: (int index) {
          this.onTapHandler(index);
        },
      ),
    );
  }

  Widget getBody() {
    if (this.selectedIndex == 0) {
      return this._myContacts;
    } else if (this.selectedIndex == 1) {
      return this._myApple;
    } else if (this.selectedIndex == 2) {
      return this._myUser;
    } else if (this.selectedIndex == 3) {
      return this._myShells;
    } else {
      return this._myNotes;
    }
  }

  void onTapHandler(int index) {
    this.setState(() {
      this.selectedIndex = index;
    });
  }
}
