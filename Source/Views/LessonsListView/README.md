# 📚 LessonsListView – AStartCode

LessonsListView is a SwiftUI view designed to display a list of C++ lessons in a visually appealing, dynamic, and interactive way. It uses a custom navigation bar style, a gradient background, and supports navigation to detailed lesson views while maintaining a flexible layout for various lessons.

## 🌟 Key Features

	1.	Custom Navigation Bar Appearance:
	•	The init method is customized to set up the navigation bar’s appearance, including:
	•	Background Color: Using a custom color (Background 2).
	•	White Text: Both for the standard and large titles, ensuring contrast and readability.
	2.	Dynamic Background:
	•	The background is a Linear Gradient from Background 2 to black, giving the view a modern and visually pleasing aesthetic.
	3.	Lesson List:
	•	A scrollable vertical list (ScrollView) that displays lesson sections (courseSections).
	•	Each lesson in the list:
	•	Shows an image, title, caption, and an “Add to Favorites” button.
	•	Uses a NavigationLink to navigate to a LessonDetailView when a lesson is selected.
	•	Customizable lesson cards with rounded corners, shadow effects, and background gradients for an attractive UI.
	4.	Binding the Tab Bar Visibility:
	•	The view binds to a showTabBar property, which is passed from a parent view. This allows the parent to control the visibility of the tab bar based on the user’s interactions.
	5.	Modular Design:
	•	Uses VStack and HStack to align the text and images in a clean, responsive layout, ensuring proper spacing and alignment.
	•	Resizable images and dynamic font sizes make the view adaptable to different device sizes.

## 🛠️ Code Breakdown

1. Custom Navigation Bar

The navigation bar is customized using UINavigationBarAppearance to:

	•	Apply a custom background color from the app’s color palette.
	•	Set white text for both the small and large title formats.

 ``` swift
let appearance = UINavigationBarAppearance()
appearance.configureWithOpaqueBackground()
appearance.backgroundColor = UIColor(named: "Background 2")
appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
```
2. Background Gradient

The view includes a linear gradient background that transitions from the "Background 2" color to black with an opacity of 0.9. The gradient covers the entire safe area.
``` swift
LinearGradient(gradient: Gradient(colors: [Color("Background 2"), Color.black.opacity(0.9)]), startPoint: .topLeading, endPoint: .bottomTrailing)
    .ignoresSafeArea()
```
3. Scrollable List of Lessons

The lessons are displayed in a vertical scrollable view. Each lesson has:

	•	An image, title, and caption.
	•	An “Add to Favorites” button with a star icon.

Each lesson card has a shadow effect, a rounded corner, and a background gradient that adds to the UI’s sleek look.
``` swift
ScrollView {
    VStack(spacing: 20) {
        ForEach(courseSections) { section in
            NavigationLink(destination: LessonDetailView(section: section, showTabBar: $showTabBar)) {
                HStack(alignment: .top, spacing: 15) {
                    section.image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 70, height: 70)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .shadow(color: section.color.opacity(0.3), radius: 5, x: 0, y: 3)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text(section.title)
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        Text(section.caption)
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.7))
                        
                        HStack(spacing: 10) {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                            Text("Add to Favorites")
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.8))
                        }
                    }
                    Spacer()
                }
                .padding()
                .background(
                    LinearGradient(gradient: Gradient(colors: [section.color.opacity(0.4), section.color.opacity(0.2)]), startPoint: .top, endPoint: .bottom)
                )
                .cornerRadius(15)
                .shadow(color: section.color.opacity(0.3), radius: 10, x: 0, y: 5)
            }
            .padding(.horizontal)
        }
    }
    .padding(.top, 20)
}
```
4. OnAppear Event

The view shows the tab bar when the list of lessons is displayed by setting showTabBar = true in the onAppear event. This ensures the tab bar is visible when returning to the list from the lesson detail.
``` swift
.onAppear {
    showTabBar = true
}
```
## 🧩 Dependencies

This view relies on a few external resources or properties:

	•	courseSections: An array of course section objects that contain details like the lesson title, image, color, and caption.
	•	LessonDetailView: A separate view where detailed information about each lesson is displayed when a lesson is selected.

## 📱 Preview

The SwiftUI preview structure allows you to view the LessonsListView in Xcode for real-time adjustments and design tweaks:
``` swift
struct LessonsListView_Previews: PreviewProvider {
    static var previews: some View {
        LessonsListView(showTabBar: .constant(true))
    }
}
```
<img width="717" alt="Screenshot 2024-10-23 at 2 06 02 PM" src="https://github.com/user-attachments/assets/9abb2f82-e83d-4404-8bb8-ccb4ca6301d0">


## 🔧 Technologies Used

	•	SwiftUI: A declarative framework to build the app’s user interface.
	•	UIKit: Used to customize the UINavigationBar’s appearance.
	•	Custom Gradients and Shadows: For a sleek, modern UI design.

 ## ✨ Future Enhancements

	•	Dynamic Data: Integrate the lesson data with a backend service or use local data to make the lesson list dynamic.
	•	Favorites Functionality: Implement the “Add to Favorites” button to store user preferences and display favorite lessons in a separate view.
