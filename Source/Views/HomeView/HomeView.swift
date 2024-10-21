import SwiftUI

struct HomeView: View {
    @Binding var showTabBar: Bool  // Binding to control tab bar visibility

    var body: some View {
        ZStack {
            Color("Background 2").ignoresSafeArea()
            ScrollView {
                content
            }
        }
    }

    var content: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                Text("Courses")
                    .foregroundColor(.white)
                    .customFont(.largeTitle)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal, 20)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(courses) { course in
                        VCard(course: course)
                            .onTapGesture {
                                withAnimation {
                                    showTabBar = false  // Hide tab bar when a course is selected
                                }
                            }
                    }
                }
                .padding(20)
                .padding(.bottom, 10)
            }

            VStack(alignment: .leading, spacing: 0) {
                Text("Featered Lessons")
                   .foregroundColor(.white)
                    .customFont(.title3)
                    .frame(maxWidth: .infinity, alignment: .leading)

                VStack(spacing: 20) {
                    ForEach(courseSections) { section in
                        HCard(section: section)
                    }
                }
            }
            .padding(20)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showTabBar: .constant(true))
    }
}
