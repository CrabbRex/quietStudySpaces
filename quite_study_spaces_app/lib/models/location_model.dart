class Location{
  final String id;
  final String name;
  final String description;
  final List<String> filterTags;
  final String photoURL;


  Location({
    required this.id,
    required this.name,
    required this.description,
    required this.filterTags,
    required this.photoURL,
  });
}