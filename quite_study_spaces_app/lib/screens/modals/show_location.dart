import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quite_study_spaces_app/models/location_model.dart';


class ShowLocation extends StatefulWidget {
  final Location location;
  const ShowLocation({super.key, required this.location});

  @override
  State<ShowLocation> createState() => _ShowLocationState();
}

class _ShowLocationState extends State<ShowLocation> {
  bool isFavorite = false; 
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.location.name),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Details:  ${widget.location.description}"),
          SizedBox(height: 8),
          Text("Address: ${widget.location.address}"),
          SizedBox(height: 8),
          Text("Tags: ${widget.location.filterTags.join(', ')}"),
          SizedBox(height: 8),
          Container(
            height: 100,
            child: Placeholder(),
          ),
          SizedBox(height: 8),
          Center(
            child: IconButton(
              onPressed: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
              icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
            )
          )
        ],
      ),
      
    );
  }
}