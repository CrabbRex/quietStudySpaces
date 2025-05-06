
import 'package:flutter/material.dart';

class ScreenState extends ChangeNotifier {
  String _status = "login";

  String get screenStatus => _status;

  void logOut() {
    _status = "login";
    notifyListeners();
  }

  void logIn() {
    _status = "homeScreen";
    notifyListeners();
  }

  void signUp() {
    _status = "signup";
    notifyListeners();
  }
}