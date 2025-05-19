import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quite_study_spaces_app/states/user_profile_state.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserProfileState>(builder: (context, state, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Hello, ${state.email}"),
          actions: [],
        ),
        body: Center(
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
                onPressed: Placeholder.new,
                child: Text("Sign Out"), 
              ),
            ],
          ),
          
        ),
        
      );
    });
  }
}
