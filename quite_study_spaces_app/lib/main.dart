import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quite_study_spaces_app/current_screen.dart';
import 'package:quite_study_spaces_app/services/auth_service.dart';
import 'package:quite_study_spaces_app/states/locationState.dart';
import 'package:quite_study_spaces_app/states/screen_state.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quite_study_spaces_app/states/user_profile_state.dart';
import 'services/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//Global Firestore instance
late FirebaseFirestore db;

const Color darkgreen = Color(0xFF153801);
const Color softGreen = Color(0xFF7FAE39);
const Color lightGray  = Color(0xFFE5E5E3);
const Color offWhite = Color(0xFFFEFCFD);
const Color black = Color(0xFF000000);


void main() async {
  //Initialise Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  db = FirebaseFirestore.instance;

  runApp(
    MultiProvider(
      providers: [
        //Insert Auth Sergice into widget tree using Provider
        //Allow access to Auth throughout code and
        //Makes for easier testing.
        Provider<AuthService>(
          create: (_) => AuthService(FirebaseAuth.instance),
        ),
        //Manage which screen is currently displayed in the app.
        ChangeNotifierProvider(create: (context) => ScreenState()),
        //Manage Location state.
        //Allow access to Locations through widget tree using Provider
        ChangeNotifierProvider(create: (context) => Locationstate(FirebaseFirestore.instance)),
        //Manage User Profile data/state.
        //Allove access to User Profile through widget tree using Provider.
        ChangeNotifierProvider(create: (context) => UserProfileState(auth: FirebaseAuth.instance)),
        
      ],
      child: MaterialApp(
        title: 'Quiet Study Spaces',
        //App wide themes:
        theme: ThemeData(
          useMaterial3: false,
          colorScheme: const ColorScheme(
            brightness: Brightness.light, 
            primary: darkgreen, 
            onPrimary: offWhite, 
            secondary: softGreen, 
            onSecondary: black, 
            error: lightGray, 
            onError: black, 
            surface: offWhite, 
            onSurface: black,
          ),
          scaffoldBackgroundColor: lightGray,
          appBarTheme: const AppBarTheme(
            backgroundColor: darkgreen,
            foregroundColor: offWhite,
            elevation: 0,
            centerTitle: true,
            titleTextStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: offWhite,
            ),
            iconTheme: IconThemeData(color: offWhite),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: softGreen,
                foregroundColor: black,
                textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12)),)
              ),
            ),
            outlinedButtonTheme: OutlinedButtonThemeData(
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.black,
                textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 36), 
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(32)),)
              )
            ),
            textTheme: const TextTheme(
              bodyMedium: TextStyle(fontSize: 16, color: black),
              titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            cardColor: offWhite,
        ),
        //Set initial screen of app.
        home: const CurrentScreen(),
      )
    )
  );
}