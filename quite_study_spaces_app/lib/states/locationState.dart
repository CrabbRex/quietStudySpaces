/*
  locationState.dart

  Manages locations data and interaction with Database.

  getLocations will return locations based on filters.

  getLocationsFromDB will return all locations from the database.

  Uses ChangeNotifier - Entered in widget tree via main.dart.
*/

import 'package:flutter/material.dart';
import 'package:quite_study_spaces_app/models/location_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Locationstate extends ChangeNotifier{
  //Initialise with Firestore instance
  //Helpfull for testing.
  final FirebaseFirestore firestore;
  Locationstate([FirebaseFirestore? firestore])
    : firestore = firestore ?? FirebaseFirestore.instance;


  final List<Location> _userLocations = [];
  List<String> _activeFilters = [];
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<Location> getLocations() {
    //No filters set:
    if(_activeFilters.isEmpty) return _userLocations;

    //Some filters set:
    List<Location> filtered = [];
    for (var location in _userLocations){
      bool matchesAll = true;

      for(var filter in _activeFilters) {
        //If a location does not have one of the filters, don't add it to the filtered list.
        if(!location.filterTags.contains(filter)){
          matchesAll = false;
          break;
        }
      }
      if (matchesAll) {
        filtered.add(location);
      }
    }
    return filtered;
  }

  void addLocation(Location locationToAdd) {
    _userLocations.add(locationToAdd);
    notifyListeners();
  }

  void deleteLocation(Location locationToAdd) {
    _userLocations.removeWhere((loc) => loc.id == locationToAdd.id);
    notifyListeners();
  }

  //Set filters to variable List _activeFilters.
  //Called whenever the search filter's are changed.
  void setFilters(List<String> filters) {
    _activeFilters = filters;
    notifyListeners();
  }

  

  //Retrieve the collection of locations stored on cloud firestore.
  //Loop through collection and add to _userLocations.
  Future<void> getLocationsFromDB() async {
    _isLoading = true;
    notifyListeners();
    try {
      final querySnapshot = await this.firestore.collection("Locations").get();
      _userLocations.clear();

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
    _isLoading = false;
    notifyListeners();
  }
}

