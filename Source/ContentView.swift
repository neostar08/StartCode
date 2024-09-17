// Added ContentView.swift
//
//  ContentView.swift
//  AStartCode
//
//  Created by Neo Star on 7/2/24.
//
import SwiftUI
import RiveRuntime
struct ContentView: View {
  var body: some View {
    @AppStorage("selectedTab") var selectedTab: Tab = .chat
    @State var isOpen = false
    @State var show = false
    let button = RiveViewModel(fileName: "menu_button", stateMachineName: "State Machine")
        ZStack {
            Color("Background 2").ignoresSafeArea()

            // SideMenu showing and hiding based on isOpen state
            SideMenu()
                .opacity(isOpen ? 1 : 0)
                .offset(x: isOpen ? 0 : -300)
                .rotation3DEffect(.degrees(isOpen ? 0 : 30), axis: (x: 0, y: 1, z: 0))
// Group ( have to create) 
          safeAreaInset(edge: .bottom) {
                Color.clear.frame(width: 80)
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
          // if selectedTab ( need to create )
           button.view()
                    .frame(width: 44, height: 44)
                    .mask(Circle())
                    .shadow(color: Color("Shadow").opacity(0.2), radius: 5, x: 0, y: 5)
                    .onTapGesture {
                        // Toggle SideMenu visibility when tapped
                        button.setInput("isOpen", value: isOpen)
                        withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                            isOpen.toggle()
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    .padding()
                    .offset(x: isOpen ? 216 : 0)
            }
 TabBar()
                .offset(y: isOpen ? 300 : 0)
                .offset(y: show ? 200 : 0)
                .offset(y: -24)
                .background(
                    LinearGradient(colors: [Color("Background").opacity(0), Color("Background")], startPoint: .top, endPoint: .bottom)
                        .frame(height: 150)
                        .frame(maxHeight: .infinity, alignment: .bottom)
                        .allowsHitTesting(false)
                )
                .ignoresSafeArea()

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
        .onAppear {
            // Prevent the button animation from auto-playing
            button.stop()
        }
    }

    func triggerAnimation() {
        // Call this function when you want to start the animation
        button.play(animationName: "open")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


          

