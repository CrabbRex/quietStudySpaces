/*
  show_location.dart

  Modal opened via 'home_screen.dart' --> Clicking on a location card.

  Displays more information about the location, with the option to add to favourites.

  Add to favourites --> Adds location id to user profile favourites.

  NOTE: Device incompatibility - Flutter Web cannot display image.file
  This will need to be fixed with File Storage Integration.
  For now, a stub implementation is used.

  Due to this, error is caught to stop crashing.
*/

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quite_study_spaces_app/main.dart';
import 'package:quite_study_spaces_app/models/location_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quite_study_spaces_app/services/auth_service.dart';


class ShowLocation extends StatefulWidget {
  final Location location;
  const ShowLocation({super.key, required this.location});

  @override
  State<ShowLocation> createState() => _ShowLocationState();
}

class _ShowLocationState extends State<ShowLocation> {
  bool isFavorite = false; 

  @override
  void initState() {
    super.initState();
    _loadUserFavourites();
  }

  Future<void> _loadUserFavourites() async {
    final authService = Provider.of<AuthService>(context, listen: false);
    final user = authService.auth.currentUser;
    if (user == null) return;


    final snapshot = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();

    if(snapshot.exists) {
      final data = snapshot.data();
      if (data != null && data.containsKey('favourites')) {
        List<dynamic> favs = data['favourites'];
        setState(() {
          isFavorite = favs.contains(widget.location.id);
          
        });
      }
    }
  }

  Widget buildImageWidget(String photoURL) {
    try{
      final file = File(photoURL);
      return Image.file(
        file,
        fit: BoxFit.cover,
        errorBuilder: (context, error, StackTrace) =>
          Center(child: Text("Image failed to load.")),
      );
    } catch (r) {
      return Center(child: Text("Image not supported on this platform"),);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: lightGray,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Text(widget.location.name),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Details:  ${widget.location.description}"),
          SizedBox(height: 10),
          Text("Address: ${widget.location.address}"),
          SizedBox(height: 10),
          Text("Tags: ${widget.location.filterTags.join(', ')}"),
          SizedBox(height: 10),
          Container(
            height: 150,
            width: double.infinity,
            child: widget.location.photoURL.isNotEmpty
              ? buildImageWidget(widget.location.photoURL)
              : Center(child: Text("No Image")),
          ),
          SizedBox(height: 8),
          Center(
            child: IconButton(
              onPressed: () async {
                //Similar to Auth Service, get Auth from widget tree not from Firebase
                //Allow better testing.
                final authService = Provider.of<AuthService>(context, listen: false);
                final user = authService.auth.currentUser;
                if (user == null) return;
                setState(() {
                  isFavorite = !isFavorite;
                });
                final userDoc = FirebaseFirestore.instance.collection('users').doc(user.uid);
                if(isFavorite)  {
                  await userDoc.update({
                    'favourites' : FieldValue.arrayUnion([widget.location.id]),
                  });
                }
                if(!isFavorite) {
                  await userDoc.update({
                    'favourites' : FieldValue.arrayRemove([widget.location.id]),
                  });
                }
              },
              icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
            )
          )
        ],
      ),
      
    );
  }
}