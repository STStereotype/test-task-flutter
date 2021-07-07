import 'package:flutter/cupertino.dart';

bool _auth = false;
bool get getAuth => _auth;

class Users with ChangeNotifier {
  void chengeBool(bool newBool) {
    _auth = newBool;
    notifyListeners();
  }
}
