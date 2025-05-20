import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:quite_study_spaces_app/screens/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quite_study_spaces_app/states/locationState.dart';
import 'package:provider/provider.dart';
import 'package:quite_study_spaces_app/widgets/quiet_Button.dart';

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
  String? _capturedImagePath;
  bool _photoTaken = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).copyWith().size.height * 0.75,
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
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
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
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
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
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                        onPressed: () async {
                          final cameras = await availableCameras();
                          //Use Navigator.push to open camera
                          //Image returned goes into imageFile var
                          final imagePath = await Navigator.push(//Nav Push pushes this screen onto the navigation stack.
                            context,
                            MaterialPageRoute(
                              //A modal route that replaces the entire screen
                              builder: (context) => takePhotoScreen(camera: cameras.first),
                            ),
                          );
                          //Stub implementation:
                          if (imagePath != null) {
                            setState(() {
                              _capturedImagePath = imagePath;
                              _photoTaken = true;
                            });
                          }
                          print(_capturedImagePath.toString());
                        },
                        child: Text("Add Photos")
                      ),
                      if(_photoTaken) Icon(Icons.check_box),
                    ],
                  ),
                ],
              ),
            ),
            quietButton(
              onPressed: () {
                List<String> tags = [];
                if (isFirstChecked) tags.add("Cafe");
                if (isSecondChecked) tags.add("View");
                final location =  {
                  "Name" : locNameController.text,
                  "Address" : locAddressController.text,
                  "description" : locDescController.text,
                  "filterTags" : tags,
                  "photoURL" : _capturedImagePath != null ? "placeholder" : "placeholder",
                };
                FirebaseFirestore.instance.collection("Locations").add(location);
                Provider.of<Locationstate>(context, listen: false).getLocationsFromDB();
                
                Navigator.pop(context);

              },
              label: "Add Location",
            ),
            TextButton(
              onPressed: () => Navigator.pop(context), 
              child: Text("Cancel"),
            )
          ],
        ));
  }
}