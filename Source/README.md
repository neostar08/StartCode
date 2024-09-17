ContentView.swift – Start Code Project

🚀 Welcome to the ContentView of the Start Code project! 🚀
This file is the heart of the Start Code application, bringing together the core UI and Rive animations to create an engaging user experience. Let’s explore what makes this view special! 👇

🌟 Overview

The ContentView.swift file defines the primary structure and user interface of the Start Code app. It combines the following key elements:

	•	Rive Animations: Integrates smooth, modern animations to enhance user interaction and give life to the UI.
	•	Tab Bar Navigation: A clean and simple tab bar for navigating between key sections of the app.
	•	Menu System: An interactive side menu that opens with stylish animations, providing access to different features within the app.

This component serves as the main hub, offering easy access to different sections like Lessons, Timer, Chat, and more.

🧑‍💻 Features

	•	Side Menu: Tap the top-left menu button to toggle a slick side menu, allowing navigation to different sections.
	•	Tab Bar: Easily switch between important sections like Lessons, Timer, User Profile, and more using the bottom tab bar.
	•	Rive Animations: Leveraging Rive for beautiful animations like the menu button toggle and onboarding transitions.
	•	Dynamic Layout: The UI is designed to scale and adapt across devices, giving a seamless experience from iPhones to iPads.

🛠️ Technologies Used

	•	SwiftUI: The core framework used for building the UI in a declarative style.
	•	Rive Animations: Used for beautiful animations and interactive components.
	•	AppStorage: For maintaining state, like the current tab selected by the user.

📂 Key Components

1. Side Menu

The interactive side menu opens and closes with an animation when the user taps the menu button. The menu slides in from the left, revealing the available sections.
```swift
SideMenu()
    .opacity(isOpen ? 1 : 0)
```
2. Rive Animation Integration

The menu button in the top-left corner is powered by Rive animations, adding a smooth and responsive experience to the app.
```swift
let button = RiveViewModel(fileName: "menu_button", stateMachineName: "State Machine")

button.view()
    .frame(width: 44, height: 44)
    .mask(Circle())
    .onTapGesture {
        button.setInput("isOpen", value: isOpen)
        withAnimation { isOpen.toggle() }
    }
```
3. Tab Navigation

The app uses a simple, intuitive tab bar at the bottom for navigation, allowing users to switch between major app sections like Lessons, Timer, and Profile.
```swift
TabBar()
    .offset(y: isOpen ? 300 : 0)
    .offset(y: show ? 200 : 0)    
    .offset(x: isOpen ? 0 : -300)
```
🎨 Visual Design

The design of the ContentView emphasizes modern aesthetics and smooth interactions. With a combination of color gradients, rounded corners, and shadows, the app feels sleek and responsive.

💡 Future Improvements

	•	Expanding the content of the Lessons section to cover more coding languages.
	•	Adding a progress tracker to the Timer tab for monitoring lesson completion.
	•	Integrating more advanced Rive animations to make the UI even more interactive.
