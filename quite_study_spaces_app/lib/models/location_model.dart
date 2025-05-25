/*
  location_model.dart

  Data model for locations as saved in databse.
*/

class Location{
  final String id;
  final String name;
  final String description;
  final String address;
  final List<String> filterTags;
  final String photoURL;


  Location({
    required this.id,
    required this.name,
    required this.description,
    required this.address,
    required this.filterTags,
    required this.photoURL,
  });
}