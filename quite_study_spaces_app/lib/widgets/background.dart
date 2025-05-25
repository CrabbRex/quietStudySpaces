/*
  background.dart

  Sets the background vine images.

  Used in all screens in stack to be behind content.
*/

import 'package:flutter/material.dart';

class backgroundWidget extends StatelessWidget {
  const backgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            right: 0,
            top: 50,
            child: Transform.scale(
              scale: 0.5,
              child: Image.asset('assets/vines1.png', fit: BoxFit.contain),
            ),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: Transform.rotate(
              angle: -2.5,
              child: Transform.scale(
                scale: 0.5,
                child: Image.asset('assets/vines2.png', fit: BoxFit.contain),
              ),
            ),
          ),
      ],
    );
  }
}