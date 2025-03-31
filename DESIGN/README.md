# App Proposal: Quiet Study Space
Find peaceful, quiet study spaces around your area. Submitted for students, by students.

## App Description:
Quiet Study Spaces is a mobile app designed to help students or remote workers find a nice place to study. Whether this be for school, university, work from home or simply needing a quiet place to recharge.

The app will allow users to find and share locations of study spaces. Users can use an inbuilt map to find location tags that indicate study spaces near them, with descriptions, photos and categories attached to each spot for easy user experience. The user can also filter their searches to find spots with specific features, like a cafe or power outlets. To make finding the best study spaces easier, each location will have a corresponding 'favourited' amount. Similarly, clicking on a study location will bring up photos submitted from other users so the current user can get a feel for the space before commiting to studying there.



## Main Features of Quiet Study Spaces:
#### Login/Authenticaion:
The Quiet Study Spaces app will have a login/signup page that will authenticate the users before allowing access to the rest of the app. This will be done through Firebase.

#### Home Page:
The home page of the app will be mainly taken up with the map. This map will use the users location and have location tags around their area for quiet spaces to go study. When a 'location tag' is clicked on, a modal will pop up, showing off the location's features and giving the user options. These options include: 'Get Directions' and 'Add to Favourites'. The modal has an industry standard 'X' in the top right to close out. <br>
The 1/3 - 1/4 of the home page will have some button options. These options include: Add Location, Filter Search as well as a navigation bar along the bottom.

#### Data Storage:
This app will store a few different types of data. First is the User Login Data. Second is the Location Tags and third is the associated filter data attached to the location, with photo's specific to locations.. Also, the user's personal favourite study spaces will be stored.</br>
This data will be stored in a remote database throught the use of either MongoDB or Firebase.

#### Add Location:
On the home page, there is a button called 'Add Location'. When pressed a modal will appear for the user to input some filter information (in the form of Check Boxes) of the study location they are submitting. This will use the users current location. There will be a big button to submit the location, aswell as 2 industry standard buttons for easy use to cancel or leave the modal.

#### Filter Locations:
Similar to the 'Add Location' button, there is a 'Filter Locations' button that will also pop up a modal. This modal will have categories for the user to fill out, including:
- Cafe/Food Options
- Power outlets available
- A view
- Collaborative study spaces
- Individual study spaces
- Library
- Wi-Fi Available
The user can choose which of these they want to include in their search. After apply these filters, the map will only show study locations that fit.

#### Favourites:
Along the navigation bar, there will be a tab for favourites. When using the app, users can 'favourite' a study spot (When in the location's modal). Then when clicking on the favourites tab, the can find all their saved study spaces and click on which one they want, showing them where it is on the map. <br>
Each location will also have an associated 'favourite amount', showing users looking for study spaces how well liked a ceratin location is.

#### Account Screen:
Along the navigation bar, there will be a tab for account. This is where users can manage their account. This includes features such as changing emails/passwords, deleting accounts and security settings like 2FA.



## Who are the users of Quiet Study Spaces?
The main target audience for Quiet Study Spaces is students, mainly in university in the age range of 18-26, however there is also a smaller target audience that includes a larger age range for high school students and remote workers. 

#### User Groups:
1. Univeristy Students - Primary User Group:
    - 18-26 age range.
    - Need quiet spaces for focused study sessions including study, lectures and assignment work.
    - May need Wi-Fi accessability, Power Outlets and Coffee/Food.
    - Often moving between places or studying between part-time work.
2. High School Students - Secondary User Group:
    - 14-18 age range.
    - Need free after-school study spots, like libraries, to complete homework.
    - More likely to study collaboratively.
    - Need easy access as high school students are unlikely to have their own transport.
3. Remote Workers - Secondary User Group:
    - 24+ age range.
    - Need consistent workplaces with power outlets and Wi-Fi.
    - Preference for collaborative spaces / loud enviroments as they may have online meetings and need to talk.

#### Persona:
Name: Cleo
Gender: She/Her
Age: 18
Occupation: Macquarie Univeristy Student and Part Time Service Industry Worker.
Pain Points:
- Likes to study in a variety of different spots.
- Needs to find good study spaces quickly, so they can get study done before class or work starts.
- Always wants a drink to sip on when studying.
- Needs reliable Wi-Fi to access online textbooks.
- Sometimes needs very quiet workspaces to focus on harder tasks.
How Cleo Will Use the App:
- Can use the app to find many different and diversified study spaces all around the City, Macquarie and Bondi Junction. She can also use the associated photos to 'scope out' the space before going there.
- Can use Quiet Study Spaces to quickly find the right Study Space. Can also use the favourites feature to remember the most functional study spaces for when she has little time between work and univeristy.
- Can use the app to find cafe's for coffees
- Can filter study spaces to find locations with free Wi-Fi
- Can filter searches to find spaces that are good for individual, focused study.

#### How Will Users Use Quiet Study Spaces:
Quiet Study Spaces benefits from it's simplicity. Users will use the app to find study spots around their current location, filtering locations to suit their specific needs. Once they find somewhere they love, they can add it to their favourites and get directions there.<br>
Users can also add locations that are not on the app. If they find somewhere they enjoy studying, they can add it's location for other users to find.

#### Why the target audience would choose Quiet Study Spaces over competitors.
The main competitor to Quiet Study Spaces would be a simple google search. Users would choose this app over something like that because it is a specialised app that has more features. A google search would give nearby study spots but it would not give the deapth that this app gives with it's options to filter locations based on preferences.<br>
Using the 'Cleo' persona, she would use Quiet Study Spaces to have the ability to make more refined searches to meet her needs. The main competitor has very vauge search results that can sometimes be wrong and take a lot of different search prompts, whereas Quiet Study Spaces will offer filtered locations that match the study space she needs that day in a timely manner.


## Design - Wireframes and mockups
For the Design of Quiet Study Spaces, the idea is to replicate the feel of a serene study space. This means a very clean, simple and tidy look to replicate that feeling. Additionally, the design needs a touch of life, similar to how a study space can be enhanced with some plant life. So greenery and plants will be incorporate into the design.

This clean design with a pop of colour from the plants its portrayed to the user with this colour palette. It uses simple white and black with a comfortable cream and the green for the plants.
![Quiet Study Spaces Colour Palette](Images/Colour_Palette.png "Color Palette")

#### WireFrames:
In order to keep the User Experience as easy as possible, keeping in mind the '3 tap rule', Quiet Study Spaces heavily leans on Modals, keeping the total screen to a minimum. As can be seen by the below WireFrames, there is a modal for 'Add Location', a modal for 'Filter Location' and a small modal that will popup when the user clicks on a Study Space on the map. Similarly, for the '3 tap rule', the navigation bar down the bottom is easily visible, but does not have too many options, so as to not overwhelm the user. 
The most taps possible to get to any point in the app is 3. For example; If a user has a modal open, it would take 1 click to close the modal, 1 click to access the accounts button on the navigation bar and one click to manage account. The limited screens of the app (by using modals), keep the user's flow easy and understandable.<br>
Here is the wireframe for the simple sign in page:
![Wireframe for login screen](Images/SignInScreenWireframe.png "SignIn WireFame") <br>

And here is the Home Page and the Modal that will pop up when the user clicks on a location:
![Gif of HomeScreen and The Modal that Pops up when a location is clicked](Images/HomeScreenModalWireframe.gif "HomeScreen1")

Here are the two modals that will popup from the home page when pressing the Home Screen's buttons 'Add Location' and 'Filter Locations':
![Gif of HomeScreen and The Modals that Pops up when a button is clicked](Images/BigModalsWireframe.gif "ButtonModals")

The last 2 wireframes are for the other 2 options on the navigation bar along the bottom. The 'Favourites' Screen and the 'Account' Screen:
![Wireframe for favourites screen](Images/FavouritesWireframe.png "Favourites Wireframe")
![Wireframe for account screen](Images/AccountWireframe.png "Accounts Wireframe")


#### WireFrames:
To increase visibility, Quiet Study Spaces keeps the UI simple and uncluttered, which can best be seen in the MockUps below, starting with the Sign In Screen:
![MockUp for login screen](Images/SignIn_Screen_MockUp.png "SignIn MockUp")

To keep in mind universal Design Priciples, the simple layout of Quiet Study Spaces allows for large buttons with lots of room between. This allows all users to be able to easily user the app.

This can best be seen with the homescreen and modals below: 
![Gif Of HomeScreen and all Modals](Images/ModalsMockUp.gif "Modals/HomeScreen Gif")

Lastly, the mock-ups for the favourites screen and the account screen, following the colour scheme:
![Favourites Screen Mockups](Images/Favourites_MockUp.png "Favourites Mockup")
![Accounts Screen Mockups](Images/Account_MockUp.png "Account Mockup")


## What will be implemented into MVP and what will be left out?
For Quiet Study Spaces, the Minimal Viable Product will implement just enough features and functionality to work. This will include:
- User Authenticaion: Signup and login with Firebase Authentication.
- Map with Study Locations: Display users currently location, show markers for study locations, clicking a marker opens the location's modal.
- Adding Study Locations: Users can add new locations using their current GPS location, submit basic names and check off the filters. This data will be stored in a database.
- Basic Filtering: Allows filtering of locations by two filters instead of the many listed.
- Favourites System: Users can favourite a study spot. A seperate screen will show the favourited spots.

What will be left out of the MVP: (For Future Development)
- Photo Uploading: Users will not be able to take and upload photos of their study spots.
- The MVP will only include a few filtering options.
- Favourite Spots Count: The location will not show how many users have favourited a spot.
- Favourite Screen Functionality: When clicking on a favourited space in the favourites screen, nothing will happen. It is just a list.
- Full Account Management: No email/username change and no 2FA in the MVP.
