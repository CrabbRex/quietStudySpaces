import 'package:flutter/material.dart';
import 'package:quite_study_spaces_app/models/location_model.dart';

class ShowLocation extends StatefulWidget {
  final Location location;
  const ShowLocation({super.key, required this.location});

  @override
  State<ShowLocation> createState() => _ShowLocationState();
}

class _ShowLocationState extends State<ShowLocation> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.location.name),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Address: ${widget.location.address}"),
          SizedBox(height: 8),
          Text("Details:  ${widget.location.description}"),
          SizedBox(height: 8),
          Text("Tags: ${widget.location.filterTags.join(', ')}"),
          SizedBox(height: 8),
          widget.location.photoURL != "N/A"
            ? Image.network(widget.location.photoURL)
            : Image.asset(
              'assets/images/placeholder.jpg',
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
        ],
      )
    );
  }
}