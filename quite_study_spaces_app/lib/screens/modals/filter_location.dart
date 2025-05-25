/*
  filter_locations.dart

  Modal opened via 'home_screen.dart' button.

  Display's user filter options.

  Changes locations displayed on home screen via 'locationState.dart'.
*/

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quite_study_spaces_app/states/locationState.dart';
import 'package:quite_study_spaces_app/widgets/quiet_Button.dart';

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
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 48),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.black,
                          width: 2.0,
                        )
                      )
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.check, color: Colors.black,),
                        SizedBox(width: 20),
                        Text(
                          "Filter Locations",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
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
            quietButton(
              onPressed: () {
                final selectedFilters = <String>[];
                if(isFirstChecked) selectedFilters.add("Cafe");
                if(isSecondChecked) selectedFilters.add("View");
                //Set filters in LocationState file.
                Provider.of<Locationstate>(context, listen: false).setFilters(selectedFilters);
                Navigator.pop(context);
              },
              label: "Apply Filters",
            ),
            TextButton(onPressed: () => Navigator.pop(context), 
            child: Text("Cancel"),
            ),
          ],
        ));
  }
}