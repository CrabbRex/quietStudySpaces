import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:quite_study_spaces_app/screens/camera.dart';
import 'package:provider/provider.dart';
import 'package:quite_study_spaces_app/states/locationState.dart';

class FilterLocation extends StatefulWidget {
  const FilterLocation({super.key});

  @override
  State<FilterLocation> createState() => _FilterLocationState();
}

class _FilterLocationState extends State<FilterLocation> {
  bool isFirstChecked = false;
  bool isSecondChecked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text("Add Filters To Your Search: "),
                  CheckboxListTile(
                    value: isFirstChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isFirstChecked = value!;
                      });
                    },
                    title: const Text("Cafe"),
                  ),
                  CheckboxListTile(
                    value: isSecondChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isSecondChecked = value!;
                      });
                    },
                    title: const Text("View"),
                  ),
                  
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final selectedFilters = <String>[];
                if(isFirstChecked) selectedFilters.add("Cafe");
                if(isSecondChecked) selectedFilters.add("View");
                //Set filters in LocationState file.
                Provider.of<Locationstate>(context, listen: false).setFilters(selectedFilters);
                Navigator.pop(context);
              },
              child: Text("Filter Locations"),
            ),
          ],
        ));
  }
}