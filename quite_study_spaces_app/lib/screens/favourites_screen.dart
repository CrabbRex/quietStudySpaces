import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text("Your favourite locations: "),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: favourites.length,
              itemBuilder: (context, index) {
                final location = favourites[index];
                return ListTile(
                  title: Text(location.name),
                );
              },
            ),
          ),
        ],
      )
    ]);
  }
}
