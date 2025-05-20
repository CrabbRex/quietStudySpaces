import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quite_study_spaces_app/main.dart';
import 'package:quite_study_spaces_app/screens/modals/add_location.dart';
import 'package:quite_study_spaces_app/states/locationState.dart';
import 'package:quite_study_spaces_app/states/screen_state.dart';
import 'package:quite_study_spaces_app/screens/modals/show_location.dart';
import 'package:quite_study_spaces_app/screens/modals/filter_location.dart';
import 'package:quite_study_spaces_app/models/location_model.dart';
import 'package:quite_study_spaces_app/widgets/quiet_Button.dart';
import 'package:quite_study_spaces_app/widgets/background.dart';

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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(10.0))),
        backgroundColor: lightGray,
        isScrollControlled: true,
        context: context,
        builder: (modalContext) => NewLocation());
  }

  void _openIndividualLocationModal(Location location) {
    showDialog(
        context: context,
        barrierDismissible: true,
        //Pass location for modal to access each database entry.
        builder: (modalContext) => ShowLocation(location: location));
  }

  void _openFilterModal() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(10.0))),
        backgroundColor: lightGray,
        isScrollControlled: true,
        context: context,
        builder: (modalContext) => FilterLocation());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Quiet Study Spaces"),
          actions: [],
        ),
        //Stack to layer images behind UI.
        body: Stack(children: [
          const backgroundWidget(),
          Consumer2<ScreenState, Locationstate>(
              builder: (context, state, locaState, child) {
            final locations = locaState.getLocations();
            final isLoading = locaState.isLoading;
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                    child: isLoading
                        ? Center(child: CircularProgressIndicator())
                        : locations.isEmpty
                          ? Center(child: Text("No Locations Yet"))
                          : ListView.builder(
                              padding: EdgeInsets.all(16),
                              itemCount: locations.length,
                              itemBuilder: (context, index) {
                                final location = locations[index];
                                return Card(
                                  color: offWhite,
                                    clipBehavior: Clip.hardEdge,
                                    elevation: 3,
                                    child: ListTile(
                                        title: Text(location.name),
                                        subtitle: Text(location.description),
                                        onTap: () {
                                          _openIndividualLocationModal(location);
                                        },
                                        trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black),
                                        ));
                              })),
                Padding(
                    padding: const EdgeInsets.only(bottom: 40.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        quietButton(
                          onPressed: _openAddLocationModal,
                          label: "Add Location",
                        ),
                        SizedBox(height: 8),
                        quietButton(
                            onPressed: _openFilterModal, label: "Filter")
                      ],
                    )),
              ],
            );
          }),
        ]));
  }
}
