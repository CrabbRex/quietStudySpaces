import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:quite_study_spaces_app/screens/home_screen.dart';
import 'package:quite_study_spaces_app/states/locationState.dart';
import 'package:quite_study_spaces_app/states/screen_state.dart';

void main() {
  testWidgets('HomeScreen displays location from Firestore', (WidgetTester tester) async{
    final mockUser = MockUser(
      isAnonymous: false,
      uid: 'test_user_id',
      email: 'test@example.com',
    );

    final mockAuth = MockFirebaseAuth(mockUser: mockUser);
    
    final fakeFirestore = FakeFirebaseFirestore();

    await fakeFirestore.collection('Locations').add({
      'Name': 'Library',
      'description': "Quiet Library at MQ",
      'Address': "4RPD",
      'filterTags': [],
      'photoURL': 'Placeholder',
    });

    final locationsState = Locationstate(fakeFirestore);

    await tester.pumpWidget(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) => ScreenState()),
        ChangeNotifierProvider<Locationstate>.value(value: locationsState),
        Provider<FirebaseAuth>.value(value: mockAuth),
      ],
      child: MaterialApp(
        home: HomeScreen(),
      )
      )
    );

    await tester.pumpAndSettle();

    expect(find.text('Library'), findsOneWidget);

    await tester.tap(find.text('Library'));
    await tester.pumpAndSettle();

    expect(find.text('Quiet Library at MQ'), findsOneWidget);

  });
}
