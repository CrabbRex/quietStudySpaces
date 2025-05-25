/*
  profile_screen.dart

  Accessed via navBar wrapper Listening to screenstate index.

  Displays bare minimum for MVP:
    - Manage your locations button --> Current logged in user can see
      and delete the locations that they have added --> Opens 'delete_locations.dart;
    - Sign Out --> Sign Out using FIrebase Auth --> Sends user to LogIn Screen.
*/

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quite_study_spaces_app/main.dart';
import 'package:quite_study_spaces_app/screens/modals/delete_locations.dart';
import 'package:quite_study_spaces_app/states/screen_state.dart';
import 'package:quite_study_spaces_app/states/user_profile_state.dart';
import 'package:quite_study_spaces_app/widgets/background.dart';
import 'package:quite_study_spaces_app/widgets/quiet_Button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final userProfileState = Provider.of<UserProfileState>(context, listen: false);
    await userProfileState.loaduserFavourites();
    setState(() {
      _isLoading = false;
    });
  }

  void _openDeleteLocations() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(10.0))),
        backgroundColor: lightGray,
        isScrollControlled: true,
        context: context,
        builder: (modalContext) => SizedBox(
          height: MediaQuery.of(context).size.height,
          child: DeleteLocations(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<UserProfileState, ScreenState>(
        builder: (context, state, screenState, child) {
          if(_isLoading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

      return Scaffold(
          appBar: AppBar(
            title: state.email == null
            ? const CircularProgressIndicator()
            : Text("Hello, ${state.email}"),
            actions: [],
          ),
          body: Stack(children: [
            const backgroundWidget(),
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                alignment: Alignment.center,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      quietButton(
                        onPressed: _openDeleteLocations,
                        label: "Manage Your Locations",
                      ),
                      SizedBox(height: 16,),
                      quietButton(
                        onPressed: () async {
                          await FirebaseAuth.instance.signOut();
                          screenState.logOut();
                        },
                        label: "Sign Out",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]));
    });
  }
}
