import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quite_study_spaces_app/states/screen_state.dart';
import 'package:quite_study_spaces_app/states/user_profile_state.dart';
import 'package:quite_study_spaces_app/widgets/background.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<UserProfileState, ScreenState>(
        builder: (context, state, screenState, child) {
      return Scaffold(
          appBar: AppBar(
            title: Text("Hello, ${state.email}"),
            actions: [],
          ),
          body: Stack(children: [
            const backgroundWidget(),
            Center(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: Placeholder.new,
                    child: Text("Manage Account"),
                  ),
                  ElevatedButton(
                    onPressed: Placeholder.new,
                    child: Text("Manage Account"),
                  ),
                  ElevatedButton(
                    onPressed: Placeholder.new,
                    child: Text("Change Email"),
                  ),
                  ElevatedButton(
                    onPressed: Placeholder.new,
                    child: Text("Delete Account"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      screenState.logOut();
                    },
                    child: Text("Sign Out"),
                  ),
                ],
              ),
            ),
          ]));
    });
  }
}
