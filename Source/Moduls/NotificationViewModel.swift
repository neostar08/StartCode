//
//  NotificationViewModel.swift
//  AStartCode
//
//  Created by Neo Star on 10/5/24.
//

import Foundation
import SwiftUI

// Notification model
struct NotificationItem: Identifiable {
    var id: UUID = UUID()
    var title: String
    var message: String
    var date: Date
}

class NotificationViewModel: ObservableObject {
    @Published var notifications: [NotificationItem] = []  // No mock notifications initially

    init() {
        loadNotifications()
    }

    // Function to load notifications from backend or Firestore
    func loadNotifications() {
        // Placeholder: Fetch real notifications here
        notifications = []  // Ensure this stays empty unless real data arrives
    }

    // Function to add a new notification (if admin sends one)
    func addNotification(title: String, message: String) {
        let newNotification = NotificationItem(title: title, message: message, date: Date())
        notifications.insert(newNotification, at: 0)  // Insert new ones at the top
    }

    // Function to clear all notifications
    func clearNotifications() {
        notifications.removeAll()
    }
}
