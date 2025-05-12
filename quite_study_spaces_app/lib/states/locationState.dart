import 'package:flutter/material.dart';
import 'package:quite_study_spaces_app/models/location_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Locationstate extends ChangeNotifier{
  final List<Location> _userLocations = [];
  List<String> _activeFilters = [];

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
    print(filtered);
    print("FILTERED");
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