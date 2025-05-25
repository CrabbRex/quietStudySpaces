/*
  favourites_screen.dart

  Accessed via navBar wrapper Listening to screenstate index.

  This widget retrieves a user's favourite locations via 'user_profile_state.dart'.
  Displays those favourites in a list.
*/

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quite_study_spaces_app/states/user_profile_state.dart';
import 'package:quite_study_spaces_app/widgets/background.dart';

class favouriteScreen extends StatefulWidget {
  const favouriteScreen({super.key});

  @override
  State<favouriteScreen> createState() => _favouriteScreenState();
}

class _favouriteScreenState extends State<favouriteScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      final userProfile = Provider.of<UserProfileState>(context, listen: false);
      await userProfile.loaduserFavourites();
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final userProfile = Provider.of<UserProfileState>(context);
    final favourites = userProfile.favouriteLocations;

    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (favourites.isEmpty) {
      return const Center(child: Text("No favourite locations yet."));
    }

    return Stack(children: [
      const backgroundWidget(),
      Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
            decoration: BoxDecoration(
              color: Color(0xFF153801),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.favorite, color: Colors.white,),
                SizedBox(width: 20),
                Text(
                  "Your Favourite Locations:",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFEFCFD),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: favourites.length,
              itemBuilder: (context, index) {
                final location = favourites[index];
                return Center(
                  child: Container(
                    width: 300,
                    child: ListTile(
                      title: Text(
                        "${index+1}. ${location.name}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    )
                  ),
                );
              },
            ),
          ),
        ],
      )
    ]);
  }
}
