import 'package:flutter/material.dart';
import 'package:quite_study_spaces_app/models/location_model.dart';

class Locationstate extends ChangeNotifier{
  final List<Location> _userLocations = [
    Location(
      id: "1",
      name: "Marcelo's Cafe",
      description: "Nice cafe near Bondi",
      address: "227 Bondi Road",
      filterTags: ["View", "Cafe"],
      photoURL: "N/A"
      ),
      Location(
      id: "2",
      name: "Up South Bondi",
      description: "Tik Tok Famous",
      address: "301 Bondi Road",
      filterTags: ["View"],
      photoURL: "N/A"
      ),
  ];

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
}