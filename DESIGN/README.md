# App Proposal: Quiet Study Spaces
Find peaceful, quiet study spaces around your area. Submitted for students, by students.

## App Description:
Quiet Study Spaces is a mobile app designed to help students or remote workers find a nice place to study. Whether this be for school, university, work from home or simply needing a quiet place to recharge.

The app will allow users to find and share locations of study spaces. Users can use an inbuilt map to find location tags that indicate study spaces near them, with descriptions, photos and categories attached to each spot for easy user experience. The user can also filter their searches to find spots with specific features, like a cafe or power outlets. To make finding the best study spaces easier, each location will have a corresponding 'favourited' amount. Similarly, clicking on a study location will bring up photos submitted from other users so the current user can get a feel for the space before committing to studying there.



## Main Features of Quiet Study Spaces:
#### Login/Authentication:
The Quiet Study Spaces app will have a login/signup page that will authenticate the users before allowing access to the rest of the app. This will be done through Firebase.

#### Home Page:
The home page of the app will be mainly taken up with the map. This map will use the users location and have location tags around their area for quiet spaces to go study. When a 'location tag' is clicked on, a modal will pop up, showing off the location's features and giving the user options. These options include: 'Get Directions' and 'Add to Favourites'. The modal has an industry standard 'X' in the top right to close out. <br>
The bottom 1/3 - 1/4 of the home page will have some button options. These options include: Add Location, Filter Search as well as a navigation bar along the bottom.

#### Data Storage:
This app will store a few different types of data. First is the User Login Data. Second is the Location Tags and third is the associated filter data attached to the location, with photo's specific to locations.. Also, the user's personal favourite study spaces will be stored.</br>
This data will be stored in a remote database.

#### Add Location:
On the home page, there is a button called 'Add Location'. When pressed, a modal will appear for the user to input the name, correlating photos and some filter information (in the form of Check Boxes) of the study location they are submitting. This will use the user's current location. There will be a big button to submit the location, as well as 2 industry standard buttons for easy use to cancel or leave the modal.

#### Filter Locations:
Similar to the 'Add Location' button, there is a 'Filter Locations' button that will also pop up a modal. This modal will have categories for the user to fill out, including:
- Cafe/Food Options
- Power outlets available
- A view
- Collaborative study spaces
- Individual study spaces
- Library
- Wi-Fi Available  
The user can choose which of these they want to include in their search. After applying these filters, the map will only show study locations that fit.

#### Favourites:
Along the navigation bar, there will be a tab for favourites. When using the app, users can 'favourite' a study spot (When in the location's modal). Then when clicking on the favourites tab, users can find all their saved study spaces and click on which one they want, showing them where it is on the map. <br>
Each location will also have an associated 'favourite amount', showing users looking for study spaces how well liked a certain location is.

#### Account Screen:
Along the navigation bar, there will be a tab for account. This is where users can manage their account. This includes features such as changing emails/passwords, deleting accounts and security settings like 2FA.



## Who are the users of Quiet Study Spaces?
The main target audience for Quiet Study Spaces is students, mainly in university in the age range of 18-26, however there is also a smaller target audience that includes a larger age range for high school students and remote workers. 

#### User Groups:
1. University Students - Primary User Group:
    - 18-26 age range.
    - Need quiet spaces for focused study sessions including study, lectures and assignment work.
    - May need Wi-Fi accessibility, Power Outlets and Coffee/Food.
    - Often moving between places or studying between part-time work.
2. High School Students - Secondary User Group:
    - 14-18 age range.
    - Need free after-school study spots, like libraries, to complete homework.
    - More likely to study collaboratively.
    - Need easy access as high school students are unlikely to have their own transport.
3. Remote Workers - Secondary User Group:
    - 24+ age range.
    - Need consistent workplaces with power outlets and Wi-Fi.
    - Preference for collaborative spaces / loud environments ments as they may have online meetings and need to talk.

#### Persona:
Name: Cleo  
Gender: She/Her  
Age: 18  
Occupation: Macquarie University Student and Part Time Service Industry Worker.  
Pain Points:  
- Likes to study in a variety of different spots.
- Needs to find good study spaces quickly, so she can get study done before class or before work starts.
- Always wants a drink to sip on when studying.
- Needs reliable Wi-Fi to access online textbooks.
- Sometimes needs very quiet workspaces to focus on harder tasks.  <br>
   
How Cleo Will Use the App:  
- Can use the app to find many different and diversified study spaces all around the City, Macquarie and Bondi Junction. She can also use the associated photos to 'scope out' the space before going there.
- Can use Quiet Study Spaces to quickly find the right Study Space. Can also use the favourites feature to remember the most functional study spaces for when she has little time between work and university.
- Can use the app to find cafes for coffees
- Can filter study spaces to find locations with free Wi-Fi
- Can filter searches to find spaces that are good for individual, focused study.

#### How Will Users Use Quiet Study Spaces:
Quiet Study Spaces benefits from its simplicity. Users will use the app to find study spots around their current location, filtering locations to suit their specific needs. Once they find somewhere they love, they can add it to their favourites and get directions there.<br>
Users can also add locations that are not on the app. If they find somewhere they enjoy studying, they can add it's location for other users to find.

#### Why the target audience would choose Quiet Study Spaces over competitors.
The main competitor to Quiet Study Spaces would be a simple google search. Users would choose this app over something like that because it is a specialised app that has more features. A google search would give nearby study spots but it would not give the depth that this app gives with it's options to filter locations based on preferences.<br>
Using the 'Cleo' persona, she would use Quiet Study Spaces to have the ability to make more refined searches to meet her needs. The main competitor has very vague search results that can sometimes be wrong and take a lot of different search prompts, whereas Quiet Study Spaces will offer filtered locations that match the study space she needs that day in a timely manner.


## Design - Wireframes and mockups
For the Design of Quiet Study Spaces, the idea is to replicate the feel of a serene study space. This means a very clean, simple and tidy look to replicate that feeling. Additionally, the design needs a touch of life, similar to how a study space can be enhanced with some plant life. So greenery and plants will be incorporated into the design.

This clean design with a pop of colour from the plants it's portrayed to the user with this colour palette. It uses simple white and black with a comfortable cream and the green for the plants.
![Quiet Study Spaces Colour Palette](Images/Colour_Palette.png "Color Palette")

#### WireFrames:
In order to keep the User Experience as easy as possible, keeping in mind the '3 tap rule', Quiet Study Spaces heavily leans on Modals, keeping the total screens to a minimum. As shown by the below WireFrames, there is a modal for 'Add Location', a modal for 'Filter Location' and a small modal that will popup when the user clicks on a Study Space on the map. Similarly, for the '3 tap rule', the navigation bar down the bottom is easily visible, but does not have too many options, so as to not overwhelm the user.
Here is the wireframe for the simple sign in page:

![Wireframe for login screen](Images/SignInScreenWireframe.png "SignIn WireFame") <br>

And here is the Home Page and the Modal that will pop up when the user clicks on a location tag on the map:
![Gif of HomeScreen and The Modal that Pops up when a location is clicked](Images/HomeScreenModalWireframe.gif "HomeScreen1")

Here are the two modals that will popup from the home page when pressing the Home Screen's buttons 'Add Location' and 'Filter Locations':
![Gif of HomeScreen and The Modals that Pops up when a button is clicked](Images/BigModalsWireframe.gif "ButtonModals")

The last 2 wireframes are for the other 2 options on the navigation bar along the bottom. The 'Favourites' Screen and the 'Account' Screen:
![Wireframe for favourites screen](Images/FavouritesWireframe.png "Favourites Wireframe")
![Wireframe for account screen](Images/AccountWireframe.png "Accounts Wireframe")


#### Mock Ups:
To increase visibility, Quiet Study Spaces keeps the UI simple and uncluttered, which can best be seen in the MockUps below, starting with the Sign In Screen:  
![MockUp for login screen](Images/SignIn_Screen_MockUp.png "SignIn MockUp")

To keep in mind universal Design Principles, the simple layout of Quiet Study Spaces allows for large buttons with lots of room in between.  

This can best be seen with the homescreen and modals below:  
![Gif Of HomeScreen and all Modals](Images/ModalsMockUp.gif "Modals/HomeScreen Gif")

Lastly, the mock-ups for the favourites screen and the account screen, following the colour scheme:  
![Favourites Screen Mockups](Images/Favourites_MockUp.png "Favourites Mockup")
![Accounts Screen Mockups](Images/Account_MockUp.png "Account Mockup")


## What will be implemented into MVP and what will be left out?
For Quiet Study Spaces, the Minimal Viable Product will implement just enough features and functionality to work. This will include:
- **User Authentication:** Signup and login.
- **Map with Study Locations:** The inbuilt map will be a basic implementation with some features missing. It will display users current location and show some hard coded markers for study locations. Clicking a marker opens the location's modal.  
- **Adding Study Locations:** Users can add new locations using their current GPS location, submit basic names and check off the filters. This feature is available through a button on the home page. However, new study locations will be local to the user and not visible to others in the MVP. Future versions should allow dynamic updates.
- **Basic Filtering:** Allows filtering of locations by two filters instead of the many listed. This feature is available through a button on the home page.
- **Navigation Bar:** Along the bottom of all screens (excluding modals) is a simple navigation bar for easy navigation of the app.  
This MVP is designed to focus on a localised version with limited map functionality and limited data sharing. Future updates will include dynamic data sharing and more advanced features.
- **Favourites System:** Users can favourite a study spot. A separate screen will show the favourited spots.
- **Accounts Screen:** Very basic implementation with limited options available for account management. 
- **Data Storage:** The MVP will use a remote database to store data. 
  
What will be left out of the MVP: (For Future Development)
- **Photo Uploading:** Users will not be able to take and upload photos of their study spots.
- **Filtering:** The MVP will only include a few filtering options.
- **Favourite Spots Count:** Locations modal's will not show how many users have favourited a spot.
- **Favourite Screen Functionality:** When users click on a favourited space in the favourites screen, no additional action will be attached. It will simply be a list of their favourited spaces.
- **Full Account Management:** More complex account management features like email/username change and two-factor authentication will be excluded.
- **Dynamic Date Sharing:** Newly added study location will not be visible to other users on the MVP.