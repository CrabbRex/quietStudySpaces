import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quite_study_spaces_app/main.dart';
import 'package:quite_study_spaces_app/states/user_profile_state.dart';
import 'package:quite_study_spaces_app/widgets/background.dart';

class DeleteLocations extends StatefulWidget {
  const DeleteLocations({super.key});

  @override
  State<DeleteLocations> createState() => _DeleteLocationsState();
}

class _DeleteLocationsState extends State<DeleteLocations> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<UserProfileState>(context, listen: false).loadUserAdded();
    });
  }

  @override
  Widget build(BuildContext context) {
    final userProfile = Provider.of<UserProfileState>(context);
    final userAdded = userProfile.userAdded;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).copyWith().size.height * 0.05),
            Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
                    decoration: BoxDecoration(
                      color: Color(0xFF153801),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.favorite,
                          color: Colors.white,
                        ),
                        SizedBox(width: 20),
                        Text(
                          "Your Favourite Locations:",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFEFCFD),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).copyWith().size.height * 0.05),
                Flexible(
                  child: ListView.builder(
                    itemCount: userAdded.length,
                    itemBuilder: (context, index) {
                      final loc = userAdded[index];
                      return Card(
                        color: offWhite,
                        child: Row(
                          children: [
                            Expanded(
                              child: ListTile(
                                title: Text(loc.name),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: ElevatedButton(
                                onPressed: Placeholder.new, 
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                  backgroundColor: darkgreen,
                                  foregroundColor: Colors.white,
                                ),
                                child: Text("Delete"),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  )
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context), 
                  child: Text("Cancel"),
                )
          ],
        ),
      ));

}
}