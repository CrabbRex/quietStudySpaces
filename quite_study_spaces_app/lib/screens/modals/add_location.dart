import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:quite_study_spaces_app/screens/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quite_study_spaces_app/states/locationState.dart';
import 'package:provider/provider.dart';

class NewLocation extends StatefulWidget {
  const NewLocation({super.key});

  @override
  State<NewLocation> createState() => _NewLocationState();
}

class _NewLocationState extends State<NewLocation> {
  final locNameController = TextEditingController();
  final locAddressController = TextEditingController();
  final locDescController = TextEditingController();
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
                  TextField(
                    controller: locNameController,
                    maxLength: 40,
                    decoration: InputDecoration(label: Text('Location Title')),
                  ),
                  TextField(
                    controller: locAddressController,
                    decoration: InputDecoration(label: Text("Address")),
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    controller: locDescController,
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    decoration: InputDecoration(
                      labelText: 'Details',
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
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
                  ElevatedButton(
                    onPressed: () async {
                      final cameras = await availableCameras();
                      //Use Navigator.push to open camera
                      //Image returned goes into imageFile var
                      final imageFile = await Navigator.push(//Nav Push pushes this screen onto the navigation stack.
                        context,
                        MaterialPageRoute(
                          //A modal route that replaces the entire screen
                          builder: (context) => takePhotoScreen(camera: cameras.first),
                        ),
                      );
                      print(imageFile.toString());
                    },
                    child: Text("Add Photos")
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                List<String> tags = [];
                if (isFirstChecked) tags.add("Cafe");
                if (isSecondChecked) tags.add("View");
                final location =  {
                  "Name" : locNameController.text,
                  "Address" : locAddressController.text,
                  "description" : locDescController.text,
                  "filterTags" : tags,
                  "photoURL" : "N/A",
                };
                FirebaseFirestore.instance.collection("Locations").add(location);
                Provider.of<Locationstate>(context, listen: false).getLocationsFromDB();
                
                Navigator.pop(context);

              },
              child: Text("Add Location"),
            ),
          ],
        ));
  }
}