//
//  ContentView.swift
//  AStartCode
//
//  Created by Neo Star on 7/2/24.
//

import SwiftUI
import FirebaseAuth
import RiveRuntime

struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .user
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = true
    @State var isOpen = false
    @State var show = false
    @State private var showTabBar = true

    let button = RiveViewModel(fileName: "menu_button", stateMachineName: "State Machine")

    var body: some View {
        ZStack {
            mainContent
        }
        .onAppear {
            button.stop()
        }
        .environmentObject(NotificationViewModel())  // Provide the environment object
    }

    var mainContent: some View {
        ZStack {
            Color("Background 2").ignoresSafeArea()

            // SideMenu showing and hiding based on isOpen state
            SideMenu(isOpen: $isOpen)
                .opacity(isOpen ? 1 : 0)
                .offset(x: isOpen ? 0 : -300)
                .rotation3DEffect(.degrees(isOpen ? 0 : 30), axis: (x: 0, y: 1, z: 0))

            Group {
                switch selectedTab {
                case .user:
                    HomeView(showTabBar: $showTabBar)  // Pass showTabBar binding
                case .chat:
                    HelpView()
                case .search:
                    LessonsListView(showTabBar: $showTabBar)
                case .timer:
                    QuizView(quizzes: sampleCPlusPlusQuizzes)
                case .bell:
                    NotificationsView()
                        .environmentObject(NotificationViewModel())  // Inject environment object
                }
            }
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: 80)
            }
            .safeAreaInset(edge: .top) {
                Color.clear.frame(height: 110)
            }
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .rotation3DEffect(.degrees(isOpen ? 30 : 0), axis: (x: 0, y: -1, z: 0))
            .offset(x: isOpen ? 265 : 0)
            .scaleEffect(isOpen ? 0.9 : 1)
            .scaleEffect(show ? 0.92 : 1)
            .ignoresSafeArea()

            if selectedTab == .user && showTabBar {
                Image(systemName: "person")
                    .frame(width: 36, height: 36)
                    .background(.white)
                    .mask(Circle())
                    .shadow(color: Color("Shadow").opacity(0.2), radius: 5, x: 0, y: 5)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            show = true
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                    .padding()
                    .offset(y: 4)
                    .offset(x: isOpen ? 100 : 0)

                button.view()
                    .frame(width: 44, height: 44)
                    .mask(Circle())
                    .shadow(color: Color("Shadow").opacity(0.2), radius: 5, x: 0, y: 5)
                    .onTapGesture {
                        button.setInput("isOpen", value: isOpen)
                        withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                            isOpen.toggle()
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    .padding()
                    .offset(x: isOpen ? 216 : 0)
            }

            if showTabBar {
                TabBar(selectedTab: $selectedTab)
                    .offset(y: isOpen ? 300 : 0)
                    .offset(y: show ? 200 : 0)
                    .offset(y: -24)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [Color("Background 2").opacity(0), Color("Background 2")]),
                            startPoint: .top, endPoint: .bottom
                        )
                        .frame(height: 150)
                        .frame(maxHeight: .infinity, alignment: .bottom)
                        .allowsHitTesting(false)
                    )
                    .ignoresSafeArea()
            }

            if show {
                OnboardingView(show: $show)
                    .background(.white)
                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .shadow(color: .black.opacity(0.5), radius: 40, x: 0, y: 40)
                    .ignoresSafeArea(.all, edges: .top)
                    .transition(.move(edge: .top))
                    .offset(y: show ? -10 : 0)
                    .zIndex(1)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(NotificationViewModel())  // Provide environment object in preview
    }
}
