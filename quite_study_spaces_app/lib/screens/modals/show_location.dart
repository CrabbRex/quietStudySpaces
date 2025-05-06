import 'package:flutter/material.dart';

class ShowLocation extends StatefulWidget {
  const ShowLocation({super.key});

  @override
  State<ShowLocation> createState() => _ShowLocationState();
}

class _ShowLocationState extends State<ShowLocation> {
  bool isFirstChecked = false;
  bool isSecondChecked = false;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Middle Modal"),
      content: Text("This will show each individual study space"),

    );
        
  }
}