import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quite_study_spaces_app/screens/modals/add_location.dart';
import 'package:quite_study_spaces_app/states/locationState.dart';
import 'package:quite_study_spaces_app/states/screen_state.dart';
import 'package:quite_study_spaces_app/screens/modals/show_location.dart';

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
    print("INIT");
  }


  void _openAddLocationModal() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context, 
      builder: (modalContext) => NewLocation()
    );
  }

  void _openIndividualLocationModal() {
    showDialog(
      context: context, 
      builder: (modalContext) => ShowLocation()
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiet Study Spaces"),
        actions: [],
      ),
      body: Consumer2<ScreenState, Locationstate>(builder: (context, state, locaState, child) {
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
                        _openIndividualLocationModal();
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
