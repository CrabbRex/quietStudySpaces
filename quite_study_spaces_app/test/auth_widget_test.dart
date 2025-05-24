import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:quite_study_spaces_app/screens/login_screen.dart';
import 'package:quite_study_spaces_app/screens/signup_screen.dart';
import 'package:quite_study_spaces_app/services/auth_service.dart';
import 'package:quite_study_spaces_app/states/screen_state.dart';

void main() {
  testWidgets('Testing Login Screen Widgets', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => ScreenState(),
        child: MaterialApp(
          home: LoginScreen(),
        ),
      ),
    );

    final emailFinder = find.text("Email");
    final passwordFinder = find.text("Password");
    final loginFinder = find.text("Log In");
    final signupFinder = find.text("Sign Up");

    expect(emailFinder, findsOneWidget);
    expect(passwordFinder, findsOneWidget);
    expect(loginFinder, findsOneWidget);
    expect(signupFinder, findsOneWidget);
  });

  testWidgets('Shows error message on empty input', (WidgetTester tester) async {
    final mockFirebaseAuth = MockFirebaseAuth();
    final authService = AuthService(mockFirebaseAuth);
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ScreenState()),
          Provider<AuthService>.value(value: authService),
        ],
        child: MaterialApp(
          home: LoginScreen(),
        ),
      ),
    );

    await tester.tap(find.text("Log In"));
    await tester.pump();

    expect(find.text("Please Enter a Valid Email and Password."), findsOneWidget);
  });

  testWidgets('Testing SignUp Screen Widgets', (WidgetTester tester) async {
    final mockFirebaseAuth = MockFirebaseAuth();
    final authService = AuthService(mockFirebaseAuth);
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ScreenState()),
          Provider<AuthService>.value(value: authService),
        ],
        child: MaterialApp(
          home: SignupScreen(),
        )
      ),
    );

    final emailFinder = find.text("Email");
    final passwordFinder = find.text("Password");
    final signupFinder = find.text("Sign Up");
    final backButtonFinder = find.byIcon(Icons.arrow_back);

    expect(emailFinder, findsOneWidget);
    expect(passwordFinder, findsOneWidget);
    expect(signupFinder, findsOneWidget);
    expect(backButtonFinder, findsOneWidget);
  });
}