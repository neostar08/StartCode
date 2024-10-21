import SwiftUI
import RiveRuntime

struct OnboardingView: View {
    let button = RiveViewModel(fileName: "button")
    
    @State var showSignInModal = false  // State to manage SignIn Modal
    @Binding var show: Bool  // State to manage the onboarding itself
    
    var body: some View {
        ZStack {
            // Background with custom color and Rive animation
            Color("Background 2").ignoresSafeArea()  // Added custom background color
            background
            
            content
                .offset(y: showSignInModal ? -50 : 0)
            
            Color("Shadow")
                .opacity(showSignInModal ? 0.4 : 0)
                .ignoresSafeArea()
            
            if showSignInModal {
                SignInView(showModal: $showSignInModal)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                    .overlay(
                        Button {
                            withAnimation(.spring()) {
                                showSignInModal = false
                            }
                        } label: {
                            Image(systemName: "xmark")
                                .frame(width: 36, height: 36)
                                .foregroundColor(.black)
                                .background(.white)
                                .mask(Circle())
                                .shadow(color:
                                            Color("Shadow").opacity(0.3),
                                        radius: 5, x: 0, y:3)
                        }
                        .frame(maxHeight: .infinity, alignment: .bottom)
                    )
                    .zIndex(1)
            }

            // Close Button for Onboarding View
            Button {
                withAnimation {
                    show.toggle()  // Closes the onboarding view
                }
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .frame(width: 36, height: 36)
                    .background(.black)
                    .mask(Circle())
                    .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 10)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding(20)
            .offset(y: showSignInModal ? -200 : 80)
        }
    }
    
    var content: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Welcome to Start Code")
                .font(.custom("Poppins Bold", size: 50, relativeTo: .largeTitle))
                .frame(width: 260, alignment: .leading)
                .foregroundColor(.white)  // Ensure text contrasts against the background
            
            Text("Unlock your potential with our interactive coding lessons. Dive into C++, C#, and more. Happy coding!")
                .customFont(.title3)
                .opacity(0.7)
                .foregroundColor(.white)  // Ensure text contrasts
                .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
            
            button.view()
                .frame(width: 236, height: 64)
                .overlay(
                    Label("Start the course", systemImage: "arrow.forward")
                        .offset(x: 4, y: 4)
                        .font(.headline)
                )
                .background(
                    Color.black
                        .cornerRadius(30)
                        .blur(radius: 10)
                        .opacity(0.3)
                        .offset(y: 10)
                )
                .onTapGesture {
                    button.play(animationName: "active")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                        withAnimation(.spring()) {
                            showSignInModal = true  // Opens the SignIn modal instead of closing the app
                        }
                    }
                }
            Text("Purchase includes access to basic programming language courses, extra quizes, source files and developers community.")
                .customFont(.footnote)
                .opacity(0.7)
                .foregroundColor(.white)  // Ensure text contrasts
        }
        .padding(40)
        .padding(.top, 40)
    }
    
    var background: some View {
        RiveViewModel(fileName: "shapes").view()
            .ignoresSafeArea()
            .blur(radius: 30)
            .background (
                Image("Spline")
                    .blur(radius: 50)
                    .offset(x: 200, y: 100)
            )
    }
    
    struct Onboarding_Previews: PreviewProvider {
        static var previews: some View {
            OnboardingView(show: .constant(true))
        }
    }
}
