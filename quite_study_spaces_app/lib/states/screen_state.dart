
import 'package:flutter/material.dart';

class ScreenState extends ChangeNotifier {
  String _status = "login";
  int _selectedNavIndex = 1;

  String get screenStatus => _status;
  int get selectedNavIndex => _selectedNavIndex;

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

  void goToSignUp() {
    _status = "signUp";
    notifyListeners();
  }

  void goToHomeScreen() {
    _status = "homeScreen";
    notifyListeners();
  }

  void changeTab(int index){
    _selectedNavIndex = index;
    notifyListeners();
  }
}