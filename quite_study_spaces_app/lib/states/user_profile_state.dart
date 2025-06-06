/*
  user_profile_state.dart

  Manages user profile data and interaction with Database.

  loaduserFavourites sets favourite locations based on current user.

  loadUserAdded sets locations added by current user.

  Uses ChangeNotifier - Entered in widget tree via main.dart.
*/

import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quite_study_spaces_app/models/location_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfileState extends ChangeNotifier{
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  UserProfileState({required this.auth, required this.firestore});
  final List<Location> _favouriteLocations = [];
  String? _email;
  final List<Location> _userAdded = [];

  List<Location> get favouriteLocations => _favouriteLocations;
  String? get email => _email;
  List<Location> get userAdded => _userAdded;


  Future<void> loaduserFavourites() async {
    //get instance of current user
    final user = auth.currentUser;
    if (user==null) return;

    try {
      //get data from user profile
      final userDoc = await firestore.collection('users').doc(user.uid).get();
      final userData = userDoc.data();
      if(userData==null) return;
      //Read in favourites from user profile
      final List<dynamic> favouriteIDs = userData['favourites'];

      _email = userData['email'] as String?;

      _favouriteLocations.clear();

      for(var id in favouriteIDs) {
        if(id is String) {
          //For each location in favourites, get the location
          final doc = await firestore.collection('Locations').doc(id).get();

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

  Future<void> addLocationToUser(String userId, String locationId) async {
    final userDoc = firestore.collection('users').doc(userId);
    await userDoc.update({
      'userAdded': FieldValue.arrayUnion([locationId])
    });
  }

  Future<void> loadUserAdded() async{
    final user = auth.currentUser;
    if (user==null) return;

    try {
      final userDoc = await firestore.collection('users').doc(user.uid).get();
      final userData = userDoc.data();
      if(userData==null) return;
      final List<dynamic> userAddedLocs = userData['userAdded'] ?? [];

      _userAdded.clear();

      for(var id in userAddedLocs) {
        final doc = await firestore.collection('Locations').doc(id).get();
        
        if(id is String) {
          
          if(doc.exists){
            final data = doc.data();
            if(data != null) {
                final location = Location (
                id: doc.id,
                name: data['Name'] ?? '',
                description: data['description'] ?? '',
                address: data['Address'] ?? '',
                filterTags: List<String>.from(data['filterTags'] ?? []),
                photoURL: data['photoURL'] ?? '',
              );
              _userAdded.add(location);
            }
          }
        }
      }
      notifyListeners();
    } catch (e){
    print("Error loading user added locations: $e");
  }
  }
  
  Future<void> deleteUserAddedLocation(String locationId) async {
    final user = auth.currentUser;
    if(user==null) return;

    try {
      final locationDoc = await firestore.collection('Locations').doc(locationId).get();
      if(locationDoc.exists){
        final data = locationDoc.data();
        final photoURL = data?['photoURL'] ?? '';
          final file = File(photoURL);
          if(photoURL.isNotEmpty){
            if(await file.exists()) {
              await file.delete();
              print("Local image deleted: $photoURL");
            }
          }
      }
      await firestore.collection('users').doc(user.uid).update({
        'userAdded': FieldValue.arrayRemove([locationId])
      });

      await firestore.collection('Locations').doc(locationId).delete();

      _userAdded.removeWhere((loc) => loc.id == locationId);
      notifyListeners();
    }catch (e) {
      print("Error deleteing user added location $e");
    }
  }
}