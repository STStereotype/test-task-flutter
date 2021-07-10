import 'package:flutter/material.dart';
import 'package:test_task_flutter/Pages/login_page.dart';
import 'package:test_task_flutter/models/news_info.dart';
import 'package:test_task_flutter/services/api_manager.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyNews extends StatefulWidget {
  MyNews({Key? key}) : super(key: key);

  @override
  _MyNewsState createState() => _MyNewsState();
}

class _MyNewsState extends State<MyNews> {
  late Future<NewsModels> _newsModel;
  @override
  void initState() {
    _newsModel = API_Manager().getNews();
    super.initState();
  }

  _news() {
    return FutureBuilder<NewsModels>(
      future: _newsModel,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data!.result.count,
              itemBuilder: (context, index) {
                var post = snapshot.data!.result.posts[index];
                return Container(
                  height: height * 0.25,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(45),
                              bottomRight: Radius.circular(45)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade700,
                                offset: Offset(0.0, 0.0),
                                blurRadius: 0.0,
                                spreadRadius: 0.0),
                          ],
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                width: 35.0,
                                height: 35.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.red,
                                        offset: Offset(0.0, 0.0),
                                        blurRadius: 0.0,
                                        spreadRadius: 1.0),
                                  ],
                                ),
                                alignment: Alignment.center,
                                child: Text(''), //Заглушка для изображения
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                margin: EdgeInsets.only(left: width * 0.175),
                                width: width,
                                height: 45.0,
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Firstname Seccondname',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ), //Заглушка для изображения
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: 50,
                                    left: width * 0.05,
                                    bottom: 40,
                                    right: width * 0.05),
                                width: width,
                                height: height * 0.22,
                                alignment: Alignment.topLeft,
                                child: Text(
                                  post.caption != null ? '${post.caption}' : '',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ), //Заглушка для изображения
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                margin: EdgeInsets.only(left: width * 0.05),
                                width: width,
                                height: 45.0,
                                alignment: Alignment.centerLeft,
                                child: Icon(
                                  FontAwesomeIcons.solidHeart,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                margin: EdgeInsets.only(
                                  left: width * 0.125,
                                ),
                                width: width,
                                height: 45.0,
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '49',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                margin: EdgeInsets.only(
                                  left: width * 0.225,
                                ),
                                width: width,
                                height: 45.0,
                                alignment: Alignment.centerLeft,
                                child: Icon(
                                  Icons.chat_bubble_outline,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                margin: EdgeInsets.only(
                                  left: width * 0.3,
                                ),
                                width: width,
                                height: 45.0,
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '12',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                          ],
                        ),
                        height: height * 0.22,
                        width: width * 0.9,
                      ),
                    ],
                  ),
                );
              });
        } else
          return Center(child: CircularProgressIndicator());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          _news(),
          Container(),
        ],
      ),
    );
  }
}

class CircleClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();

    path.addOval(new Rect.fromCircle(
        center: new Offset(size.width / 2, size.height / 2),
        radius: size.width * 0.45));

    return Path();
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
