import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quite_study_spaces_app/current_screen.dart';
import 'package:quite_study_spaces_app/screens/favourites_screen.dart';
import 'package:quite_study_spaces_app/states/locationState.dart';
import 'package:quite_study_spaces_app/states/screen_state.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quite_study_spaces_app/states/user_profile_state.dart';
import 'services/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

late FirebaseFirestore db;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  db = FirebaseFirestore.instance;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ScreenState()),
        ChangeNotifierProvider(create: (context) => Locationstate()),
        ChangeNotifierProvider(create: (context) => UserProfileState()),
      ],
      child: MaterialApp(
        home: const CurrentScreen(),
      )
    )
  );
}