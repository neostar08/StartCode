# 🔔 NotificationsView – AStartCode Notifications Module

Stay up-to-date with app notifications! The **NotificationsView** module provides users with an organized view of alerts, messages, and updates in the **AStartCode** app. This view includes a beautiful gradient background, an empty state for no notifications, and a styled list of notifications when available.

## 🛠 Features

- 📱 **Dynamic Notification List** – Displays each notification with a timestamp, title, and message.
- 🎨 **Gradient Background** – A visually pleasing gradient background for contrast and readability.
- 🔔 **Interactive Empty State** – Shows an informative message and icon when there are no notifications.
- 🌙 **Customizable Styling** – Each notification card has a unique shadow and background style for emphasis.

## 📂 Project Structure

📦 Notifications Module  
├── 📂 ViewModels  
│   └── NotificationViewModel.swift   # Manages notifications data and state  
├── 📂 Views  
│   ├── NotificationsView.swift       # Main notifications view with list and empty state  
│   └── NotificationRow.swift         # Custom row view for individual notifications  
└── 📂 Assets  
    └── Colors and icons  

## 💡 How It Works

### 🔗 Notifications Display

The **NotificationsView** uses SwiftUI to dynamically display notifications managed by `NotificationViewModel`. If there are no notifications, the view presents an empty state with a custom icon and text. When notifications are available, each notification is shown as a **NotificationRow**.

### Example Code for Displaying Notifications List

```swift
ScrollView {
    VStack(spacing: 15) {
        ForEach(notificationVM.notifications) { notification in
            NotificationRow(notification: notification)
        }
    }
    .padding()
}
```
## 📋 NotificationRow Component (NotificationRow.swift)

The NotificationRow view shows individual notifications, styled with a distinct icon, title, message, and timestamp in a compact card layout.
``` swift
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
                .fill(Color(hex: "1C1C1E"))
                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 2)
        )
    }
}
```
## 📅 Date Formatter – Format Timestamps

The dateFormatter helper formats each notification’s timestamp into a short date and time format.
``` swift
private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .short
    return formatter
}()
```
## ✨ Empty State – When No Notifications Are Available

When there are no notifications, NotificationsView displays an empty state with a bell icon and message, informing users that they will receive updates here.
``` swift
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
}
```
## ✨ NotificationsView Preview

Preview the NotificationsView in Xcode, with sample data provided by NotificationViewModel.
``` swift
struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
            .environmentObject(NotificationViewModel())
    }
}
```
With NotificationsView, users stay informed about important updates in the app with a clean, accessible interface.
