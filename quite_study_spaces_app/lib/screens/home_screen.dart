import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quite_study_spaces_app/screens/modals/add_location.dart';
import 'package:quite_study_spaces_app/states/locationState.dart';
import 'package:quite_study_spaces_app/states/screen_state.dart';
import 'package:quite_study_spaces_app/screens/modals/show_location.dart';
import 'package:quite_study_spaces_app/screens/modals/filter_location.dart';
import 'package:quite_study_spaces_app/models/location_model.dart';
import 'package:quite_study_spaces_app/widgets/quiet_Button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    //Calling the Locationstate function to update the state with all the 
    //locations in the database.
    Provider.of<Locationstate>(context, listen: false).getLocationsFromDB();
  }


  void _openAddLocationModal() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context, 
      builder: (modalContext) => NewLocation()
    );
  }

  void _openIndividualLocationModal(Location location) {
    showDialog(
      context: context,
      barrierDismissible: true,
      //Pass location for modal to access each database entry.
      builder: (modalContext) => ShowLocation(location: location)
    );
  }

  void _openFilterModal() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (modalContext) => FilterLocation()
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiet Study Spaces"),
        actions: [],
      ),
      //Stack to layer images behind UI.
      body: Stack(
        children: [
          Positioned(
            right: 0,
            top: 50,
            child: Transform.scale(
              scale: 0.5,
              child: Image.asset('assets/vines1.png', fit: BoxFit.contain),
            ),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: Transform.rotate(
              angle: -2.5,
              child: Transform.scale(
                scale: 0.5,
                child: Image.asset('assets/vines2.png', fit: BoxFit.contain),
              ),
            ),
          ),
      
      Consumer2<ScreenState, Locationstate>(builder: (context, state, locaState, child) {
        final locations = locaState.getLocations();
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: locations.isEmpty
              ? Center(child: Text("No Locations Yet"))
              : ListView.builder(
                padding: EdgeInsets.all(16),
                itemCount: locations.length,
                itemBuilder: (context, index){
                  final location = locations[index];
                  return Card(
                    clipBehavior: Clip.hardEdge,
                    elevation: 3,
                    child: ListTile(
                      title: Text(location.name),
                      subtitle: Text(location.description),
                      onTap:() {
                        _openIndividualLocationModal(location);
                      }
                    )
                  );
                }
              )
              
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  quietButton(
                    onPressed: _openAddLocationModal,
                    label: "Add Location",
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _openFilterModal, 
                    child: Text("Filter"))
                ],
              )
            ),
          ],
        );
      }),
        ]
    )
    );
  }
}
