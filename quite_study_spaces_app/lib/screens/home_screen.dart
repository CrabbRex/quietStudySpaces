import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quite_study_spaces_app/current_screen.dart';
import 'package:quite_study_spaces_app/screens/login_screen.dart';
import 'package:quite_study_spaces_app/screens/modals/add_location.dart';
import 'package:quite_study_spaces_app/states/locationState.dart';
import 'package:quite_study_spaces_app/states/screen_state.dart';
import 'package:quite_study_spaces_app/screens/modals/add_location.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  void _openAddLocationModal() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context, 
      builder: (modalContext) => NewLocation()
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiet Study Spaces"),
        actions: [],
      ),
      body: Consumer<ScreenState>(builder: (context, state, child) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(child: Center(child: Text("Home Screen"))),
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: _openAddLocationModal,
                    child: Text("Add Location"),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: Placeholder.new, 
                    child: Text("Filter"))
                ],
              )
            ),
          ],
        );
      }),
    );
  }
}
