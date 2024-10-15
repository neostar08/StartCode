//
//  LessonsListView.swift
//  AStartCode
//
//  Created by Neo Star on 9/12/24.
//

import SwiftUI

struct LessonsListView: View {
    @Binding var showTabBar: Bool  // This binding should be passed from the parent view

    // Initializer to set up custom navigation bar appearance
    init(showTabBar: Binding<Bool>) {
        self._showTabBar = showTabBar  // Bind the parameter to the property

        // Customizing the navigation bar appearance
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(named: "Background 2")  // Set the background to your custom color
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]  // Set the title color to white
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]  // Large title color

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }

    var body: some View {
        NavigationView {
            ZStack {
                // Background Color Gradient
                LinearGradient(gradient: Gradient(colors: [Color("Background 2"), Color.black.opacity(0.9)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()

                VStack(alignment: .leading) {
                    Text("Explore C++ Lessons")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, 40)
                        .padding(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    Divider().background(Color.white.opacity(0.5))  // Add a divider for separation

                    ScrollView {
                        VStack(spacing: 20) {
                            ForEach(courseSections) { section in
                                // Pass showTabBar binding to LessonDetailView
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
                }
            }
        }
        .accentColor(.white)  // Change the color of navigation links to white
        .onAppear {
            showTabBar = true  // Show tab bar when viewing the list of lessons
        }
    }
}

struct LessonsListView_Previews: PreviewProvider {
    static var previews: some View {
        LessonsListView(showTabBar: .constant(true))
    }
}
