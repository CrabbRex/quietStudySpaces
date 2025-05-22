class User{
  final String uid;
  final String email;
  final List<String> favourites;
  final List<String> userAdded;

  User({
    required this.uid,
    required this.email,
    required this.favourites,
    required this.userAdded,
  });
}