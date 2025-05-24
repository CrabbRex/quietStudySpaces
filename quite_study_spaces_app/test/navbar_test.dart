import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:quite_study_spaces_app/services/auth_service.dart';
import 'package:quite_study_spaces_app/states/locationState.dart';
import 'package:quite_study_spaces_app/states/user_profile_state.dart';
import 'package:quite_study_spaces_app/widgets/nav_bar.dart';
import 'package:quite_study_spaces_app/states/screen_state.dart';

void main() {
  testWidgets('Tapping NavBar changes the screen', (WidgetTester tester) async {
    final mockUser = MockUser(
      isAnonymous: false,
      uid: 'test_user_id',
      email: 'test@example.com'
    );

    final mockAuth = MockFirebaseAuth(mockUser: mockUser);
    final fakeFirestore = FakeFirebaseFirestore();

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          Provider<AuthService>.value(value: AuthService(mockAuth)),
          ChangeNotifierProvider(create: (_) => ScreenState()),
          ChangeNotifierProvider(create: (_) => Locationstate(fakeFirestore)),
          ChangeNotifierProvider(create: (_) => UserProfileState(auth: mockAuth)),
          Provider<FirebaseAuth>.value(value: mockAuth),
        ],
        child: MaterialApp(
          home: navBar(),
        )
      )
    );
    await tester.pumpAndSettle();
    expect(find.text('Home'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.home));
    await tester.pumpAndSettle();

    expect(find.text('Add Location'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.favorite));
    await tester.pumpAndSettle();

    expect(find.text('No favourite locations yet.'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.account_circle_outlined));
    await tester.pumpAndSettle();

    expect(find.text('Change Email'), findsOneWidget);

  });
}