import 'package:flutter/material.dart';

Widget quietButton({required VoidCallback onPressed, required String label}) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
    ),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      onPressed: onPressed, 
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        )
      )
    )
  );
}