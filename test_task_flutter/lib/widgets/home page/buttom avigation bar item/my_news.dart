import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_task_flutter/Pages/login_page.dart';
import 'package:test_task_flutter/models/news_info.dart';
import 'package:test_task_flutter/services/api_manager.dart';
import 'package:test_task_flutter/widgets/common/text.dart';

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
    var i = 1;
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
                  height: 100,
                  child: Row(
                    children: <Widget>[],
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
