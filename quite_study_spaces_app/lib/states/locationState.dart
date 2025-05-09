import 'package:flutter/material.dart';
import 'package:quite_study_spaces_app/models/location_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Locationstate extends ChangeNotifier{
  final List<Location> _userLocations = [];

  List<Location> getLocations() {
    return _userLocations;
  }

  void addLocation(Location locationToAdd) {
    _userLocations.add(locationToAdd);
    notifyListeners();
  }

  void deleteLocation(Location locationToAdd) {
    _userLocations.removeWhere((loc) => loc.id == locationToAdd.id);
    notifyListeners();
  }

  //Retrieve the collection of locations stored on cloud firestore.
  //Loop through collection and add to _userLocations.
  Future<void> getLocationsFromDB() async {
    try {
      final querySnapshot = await FirebaseFirestore.instance.collection("Locations").get();

      for(var doc in querySnapshot.docs){
        final data = doc.data();
        final location = Location(
          id: doc.id,
          name: data['Name'],
          description: data['description'],
          address: data['Address'],
          filterTags: List<String>.from(data['filterTags']),
          photoURL: data['photoURL'],
        );
        _userLocations.add(location);
        print("ADDED");
      }
      notifyListeners();
    } catch (e) {
      print("Error loading locations: $e");
    }
  }
}