//
//  NotificationsView.swift
//  AStartCode
//
//  Created by Neo Star on 10/5/24.
//

import SwiftUI

struct NotificationsView: View {
    @EnvironmentObject var notificationVM: NotificationViewModel

    var body: some View {
        ZStack {
            // Background Gradient for Better Contrast
            LinearGradient(
                gradient: Gradient(colors: [Color("Background 2"), Color.black.opacity(0.85)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack {
                Spacer(minLength: 100) // Push the content slightly above the center

                if notificationVM.notifications.isEmpty {
                    // Empty State View for No Notifications
                    VStack(spacing: 20) {
                        Image(systemName: "bell.slash.fill")
                            .font(.system(size: 64))
                            .foregroundColor(.yellow.opacity(0.8))

                        Text("No New Notifications Yet!")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white.opacity(0.9))

                        Text("You'll receive alerts, messages, and updates here.")
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.7))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                    .padding(40)
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color.black.opacity(0.4))
                            .shadow(color: .black.opacity(0.5), radius: 15, x: 0, y: 10)
                    )
                    .padding(.horizontal, 20)
                } else {
                    // Notification List View
                    ScrollView {
                        VStack(spacing: 15) {
                            ForEach(notificationVM.notifications) { notification in
                                NotificationRow(notification: notification)
                            }
                        }
                        .padding()
                    }
                }

                Spacer() // Maintain spacing at the bottom
            }
            .navigationTitle("Notifications")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// NotificationRow View for Each Notification
struct NotificationRow: View {
    var notification: NotificationItem

    var body: some View {
        HStack {
            Image(systemName: "bell.fill")
                .foregroundColor(.yellow)
                .font(.system(size: 30))

            VStack(alignment: .leading, spacing: 4) {
                Text(notification.title)
                    .font(.headline)
                    .foregroundColor(.white)

                Text(notification.message)
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.8))

                Text("\(notification.date, formatter: dateFormatter)")
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.5))
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color(hex: "1C1C1E")) // Darker color for better contrast
                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 2)
        )
        .padding(.vertical, 5)
    }
}

// Date Formatter for Notifications
private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .short
    return formatter
}()

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
            .environmentObject(NotificationViewModel())
    }
}
