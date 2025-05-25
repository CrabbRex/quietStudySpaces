/*
  quiet_Button.dart

  Custom button used through app for UI.
*/

import 'package:flutter/material.dart';
import 'package:quite_study_spaces_app/main.dart';

Widget quietButton({required VoidCallback onPressed, required String label}) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
    ),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF153801),
        shadowColor: Colors.transparent,
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 56),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      onPressed: onPressed, 
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: offWhite,
        )
      )
    )
  );
}