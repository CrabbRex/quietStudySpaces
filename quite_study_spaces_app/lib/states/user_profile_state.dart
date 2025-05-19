import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quite_study_spaces_app/models/location_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfileState extends ChangeNotifier{
  final List<Location> _favouriteLocations = [];

  List<Location> get favouriteLocations => _favouriteLocations;

  Future<void> loaduserFavourites() async {
    //get instance of current user
    final user = FirebaseAuth.instance.currentUser;
    if (user==null) return;

    try {
      //get data from user profile
      final userDoc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
      final userData = userDoc.data();
      if(userData==null) return;
      //Read in favourites from user profile
      final List<dynamic> favouriteIDs = userData['favourites'];

      _favouriteLocations.clear();

      for(var id in favouriteIDs) {
        if(id is String) {
          //For each location in favourites, get the location
          final doc = await FirebaseFirestore.instance.collection('Locations').doc(id).get();

          if(doc.exists) {
            final data = doc.data();
            if(data != null) {
              //Add location to favoruties.
              final location = Location(
                id: doc.id,
                name: data['Name'] ?? '',
                description: data['description'] ?? '',
                address: data['Address'] ?? '',
                filterTags: List<String>.from(data['filterTags'] ?? []),
                photoURL: data['photoURL'] ?? '',
              );

              _favouriteLocations.add(location);
            }
          }
        }
      }
      notifyListeners();
    } catch (e) {
      print("Error fetching values: $e");
    }
  }
}