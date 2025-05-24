import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:quite_study_spaces_app/current_screen.dart';
import 'package:quite_study_spaces_app/services/auth_service.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:quite_study_spaces_app/states/locationState.dart';
import 'package:quite_study_spaces_app/states/screen_state.dart';
import 'package:quite_study_spaces_app/states/user_profile_state.dart';

void main() {
  test('LogIn returns Sucess for valid credentials', () async {
    final mockUser = MockUser(
      uid: 'fakeuid',
      email: 'test@example.com',
    );
    final mockAuth = MockFirebaseAuth(mockUser: mockUser);
    final authService = AuthService(mockAuth);

    final result = await authService.logIn(
      email: 'test@example.com', 
      password: 'password1234'
    );

    expect(result, 'Sucess');
    expect(mockAuth.currentUser?.email, 'test@example.com');
  });

  test('SignUp returns Sucess for valid credentials', () async {
    final mockUser = MockUser(
      uid: 'abc123',
      email: 'test@example.com',
    );
    final mockAuth = MockFirebaseAuth(mockUser: mockUser);
    final authService = AuthService(mockAuth);

    final result = await authService.signUp(
      email: 'newUser@example.com',
      password: 'password123',
    );

    expect(result, 'Sucess');
    expect(mockAuth.currentUser?.email, 'newUser@example.com');
  });

  testWidgets('Test user login will see homescreen', (WidgetTester tester) async {
    final email = 'test@example.com';
    final password = 'password1234';

    final mockUser = MockUser(
      isAnonymous: false,
      uid: 'mock-uid',
      email: email,
      displayName: 'Mock User',
    );

    final mockFirebaseAuth = MockFirebaseAuth(
      signedIn: false,
      mockUser: mockUser,
    );

    final mockAuth = MockFirebaseAuth(mockUser: mockUser);

    final authService = AuthService(mockFirebaseAuth);

    await tester.pumpWidget(
  MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ScreenState()),
      ChangeNotifierProvider(create: (_) => Locationstate()),
      ChangeNotifierProvider(create: (_) => UserProfileState(auth: mockAuth)),
      Provider<AuthService>.value(value: authService),
    ],
    child: MaterialApp(home: CurrentScreen()),
  ),
);

    final emailField = find.widgetWithText(TextFormField, 'Email');
    final passwordField = find.widgetWithText(TextFormField, 'Password');
    final loginButton = find.widgetWithText(OutlinedButton, 'Log In');

    await tester.enterText(emailField, email);
    await tester.enterText(passwordField, password);
    await tester.tap(loginButton);
    await tester.pump();

    expect(mockFirebaseAuth.currentUser?.email, equals(email));

    //Test is screen has changed after login.
    await tester.pumpAndSettle();
    expect(find.text('Add Location'), findsOneWidget);
  });
}