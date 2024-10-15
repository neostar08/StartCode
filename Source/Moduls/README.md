# 📚 C++ Learning App – Modular Views for Beginners 🚀

	Learn C++ step-by-step with well-organized lessons, interactive quizzes, and beautiful UI design. This app provides in-depth learning modules with compiler-style code snippets to make programming fun and easy!

## 🛠 Features

	•	🧩 Modular Views – Each course section and lesson is structured for scalability and performance.
	•	🎨 Beautiful UI with Gradient Design – Clean, modern layout with smooth navigation.
	•	⭐ Favorites Feature – Save your lessons and access them easily.
	•	🧑‍🏫 Detailed Lessons – Learn through practical examples and compiler-style code snippets.
	•	🔔 Notifications & Updates – Stay informed about new lessons (coming soon).
	•	📦 Firebase Integration – Save user progress (optional feature).

📂 Project Structure

📦 C++ Learning App
├── 📂 Models
│   └── CourseSection.swift      # CourseSection model with modular lessons
├── 📂 Views
│   ├── CourseSectionListView.swift  # Main course section view with navigation
│   ├── LessonDetailView.swift      # Detailed lesson pages
│   ├── CodeBlock.swift             # View for displaying code snippets
│   └── FavoritesView.swift         # Manage and view favorite lessons
├── 📂 Assets
│   └── Images and color assets
└── README.md                     # Documentation (this file)

💡 How It Works

🔗 Navigation through Course Sections

The CourseSectionListView shows all available sections. When a section is tapped, it navigates to the corresponding detailed lesson view.

NavigationLink(destination: section.destination) {
    CourseSectionCardView(section: section)
}

📋 Course Section Model (CourseSection.swift)

The CourseSection model defines the structure of each lesson section, including title, caption, colors, images, and lesson content.

struct CourseSection: Identifiable {
    var id = UUID()
    var title: String
    var caption: String
    var color: Color
    var image: Image
    var destination: AnyView
}

Example Course Section with a detailed lesson:

CourseSection(
    title: "Introduction to C++",
    caption: "Start Here",
    color: Color(hex: "9CC5FF"),
    image: Image("Avatar 2"),
    destination: AnyView(IntroductionLessonView())
)

📘 Lesson Details (LessonDetailView.swift)

Each lesson detail view presents the topic using highlighted code blocks, text explanations, and navigation tools.

struct IntroductionLessonView: View {
    var body: some View {
        VStack {
            Text("Introduction to C++").font(.largeTitle).bold()
            CodeBlock(code: """
            #include <iostream>
            int main() {
                std::cout << "Hello, World! Welcome to C++!" << std::endl;
                return 0;
            }
            """)
        }
    }
}

💻 CodeBlock View – Display Code with Compiler Style

The CodeBlock view renders code snippets with a monospaced font, providing a compiler-like look and feel.

struct CodeBlock: View {
    let code: String
    
    var body: some View {
        ScrollView(.horizontal) {
            Text(code)
                .font(.system(.body, design: .monospaced))
                .padding()
                .background(Color.black.opacity(0.8))
                .foregroundColor(.green)
                .cornerRadius(10)
                .padding(.horizontal)
        }
    }
}

✨ Favorites View – Save Your Progress

Users can mark lessons as favorites. The favorites view displays all saved lessons in an organized manner.

