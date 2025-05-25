# Mobile Application Development Project for COMP3130

## Quiet Study Spaces:
Quiet Study Spaces is an cross-platform flutter app made for students, or those looking for a Quiet Space to study/work in.\\
Users can browse, add and filter study locations. Allowing photo uploading, descriptive tags and location manageability.\\
The app prioritises simplicity, accessibilty and clean UI.



Here is the App Proposal: [App Propsal](DESIGN/README.md)

## Implementation:

### Limitations:
Image Storage:
- Images are saved locally, as Firebase storage was not usable.
- Since images are saved locally, Flutter Web does not support Image.file. Therefore, loading images (When clicking on locations) will not work. 
- Note: This does work on android emulator.

Camera Functionality:
- Camera functions differently across different devices. It was found the live camera looks best on Flutter Web, but works best on Android Emulator.

### Changes from MVP Proposal:
#### Change in Device Service Use:
- Upon receiving feedback (on my App Proposal) and further reflection, the use of **Maps for device capabilities was swapped out for taking photos.**
- Map device services was pushed to a stretch goal as outlined in Room for Future Development below.
- The Home Page is mainly affected by this, so instead of the map, the space the map would take up is taken up by Locations. These cards can be clicked and open more information about the location (including a photo).

#### Addition of 'Manage Your Locations':
- The App Proposal outlined no way for user's to manage the locations they had added.
- The MVP now has the ability to view and delete locations based on the user logged in.

All other goals for the MVP were implemented to at least basic functionality.

### Main Functionality:
- User Authentication: Sign up or Log in with Firebase
- Browse Locations: View a list of user submitted locations.
- Add New Locations: Users can add their own locations with a Name, Description, Filters and optionally a photo.
- Database: Locations and User Profiles are stored in a Firebase Database and information is retirieved throughout the app.
- Filter Locations: Users can filter the locations for better browsing.
- Manage Locations: Users can manage the locations they have created, allowing the option to delete them.
- Favourites: Users can add locations to their favourites, which are displayed on the favourites screen.

### Device Compatability:
Photo's on Chrome:
- To implement a stub implementation for photos (No access to Firebase Storage), photo's are saved locally (if taken).
- However, Flutter Web cannot show these.
- To counter the app crashing, if the file cannot be loaded, an error is shown.

Quiet Study Spaces was tested on Chrome Browser and Android Simulator.

### Integration with Firebase:
This app uses Both Firebase Authentication (For Auth and Authz) and Firebase Firestore Database. Further information on the implementation can be found in the project documentation.

### Room for future development:
- Firebase photo uploading.
- The main next goal is maps integration. Including directions, map tags and pop-up modals.
- Rating System.
- Improved searching and filtering.
- Improved location - Just near user.