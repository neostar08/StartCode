//
//  TabBar.swift
//  AStartCode
//
//  Created by Neo Star on 7/23/24.
//

import SwiftUI
import RiveRuntime

struct TabBar: View {
    @Binding var selectedTab: Tab  // Use @Binding to accept a reference to the selectedTab state

    var body: some View {
        VStack {
            Spacer()
            HStack {
                content
            }
            .padding(12)
            .background(
                // Applying the gradient background
                LinearGradient(
                    gradient: Gradient(colors: [Color("Background 2"), Color.black.opacity(0.9)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
            )
            .mask(RoundedRectangle(cornerRadius: 24, style: .continuous))
            .shadow(color: Color("Background 2").opacity(0.3), radius: 20, x: 0, y: 20)
            // Removed the white gradient overlay here
            .overlay(
                RoundedRectangle(cornerRadius: 24, style: .continuous)
                    .stroke(
                        Color.clear,  // No stroke color for a clean look
                        lineWidth: 0
                    )
            )
            .padding(.horizontal, 24)
        }
    }

    var content: some View {
        ForEach(tabItems) { item in
            Button {
                item.icon.setInput("active", value: true)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    item.icon.setInput("active", value: false)
                }
                withAnimation {
                    selectedTab = item.tab
                }
            } label: {
                item.icon.view()
                    .frame(height: 36)
                    .opacity(selectedTab == item.tab ? 1 : 0.5)
                    .background(
                        VStack {
                            RoundedRectangle(cornerRadius: 2)
                                .frame(width: selectedTab == item.tab ? 20 : 0, height: 4)
                                .offset(y: -4)
                                .opacity(selectedTab == item.tab ? 1 : 0)
                            Spacer()
                        }
                    )
            }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(selectedTab: .constant(.user))  // Use a constant binding for preview
    }
}

struct TabItem: Identifiable {
    var id = UUID()
    var icon: RiveViewModel
    var tab: Tab
}

var tabItems = [
    TabItem(icon: RiveViewModel(fileName: "icons", stateMachineName: "USER_Interactivity", artboardName: "USER"), tab: .user),
    TabItem(icon: RiveViewModel(fileName: "icons", stateMachineName: "CHAT_Interactivity", artboardName: "CHAT"), tab: .chat),
    TabItem(icon: RiveViewModel(fileName: "icons", stateMachineName: "SEARCH_Interactivity", artboardName: "SEARCH"), tab: .search),
    TabItem(icon: RiveViewModel(fileName: "icons", stateMachineName: "TIMER_Interactivity", artboardName: "TIMER"), tab: .timer),
    TabItem(icon: RiveViewModel(fileName: "icons", stateMachineName: "BELL_Interactivity", artboardName: "BELL"), tab: .bell)
]

enum Tab: String {
    case user
    case search
    case chat
    case timer
    case bell
}
