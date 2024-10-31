# 📋 MenuRow – AStartCode Components

MenuRow is a custom SwiftUI component designed for the AStartCode app to render individual menu items with interactive animations and dynamic styling. Using Rive animations, each menu item provides a visually engaging experience as users navigate the menu.

##n🌟 Key Features

	1.	Interactive Rive Icon Animations:
	•	Each menu item features an icon powered by Rive animations. The animation is triggered when the item is tapped, giving feedback to the user and enhancing interactivity.
	2.	Customizable Menu Item:
	•	The menu item text and icon can be customized based on the MenuItem model, allowing flexibility for different menu options.
	3.	Selected State Styling:
	•	The background of the selected menu item highlights, providing visual feedback to indicate which menu item is currently active. This feature uses a custom color (Background 2) and opacity for a subtle yet elegant effect.

## 🛠️ Code Breakdown

1. Rive Icon Display

The menu item icon is displayed using Rive’s runtime, which allows for smooth animations and scalable vector graphics. The icon has an opacity of 0.6 to blend seamlessly with the app’s color scheme.
``` swift
Text(item.text)
    .customFont(.headline)
    .frame(maxWidth: .infinity, alignment: .leading)
    .padding(12)
```
2. Dynamic Menu Item Text

The menu text is styled with a custom font (.headline) and aligned to the left for readability. This text adjusts dynamically based on the MenuItem properties passed to MenuRow.
``` swift
Text(item.text)
    .customFont(.headline)
    .frame(maxWidth: .infinity, alignment: .leading)
    .padding(12)
```
3. Selected State Background

The background of the selected menu item is set to white with a reduced opacity, providing a subtle highlight effect to indicate the active menu item. A rounded rectangle with a continuous style creates a smooth, responsive design.
``` swift
.background(
    RoundedRectangle(cornerRadius: 10, style: .continuous)
        .fill(selectedMenu == item.menu ? Color.white.opacity(0.1) : Color.clear)
        .frame(maxWidth: selectedMenu == item.menu ? .infinity : 0)
        .frame(maxWidth: .infinity, alignment: .leading)
)
.background(Color("Background 2"))
```
4. Tap Gesture and Rive Animation Trigger

When a menu item is tapped, it triggers an “active” input in the Rive animation, creating an interactive animation effect for the icon. The selection also smoothly transitions to the tapped item using a custom timing curve.
``` swift
.onTapGesture {
    item.icon.setInput("active", value: true)
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        item.icon.setInput("active", value: false)
    }
    withAnimation(.timingCurve(0.2, 0.8, 0.2, 1)) {
        selectedMenu = item.menu
    }
}
```
## 🧩 Dependencies

	•	RiveRuntime: For embedding and animating Rive icons.
	•	MenuItem Model: The MenuItem model holds the icon and text for each menu item, as well as the associated menu identifier.
	•	SelectedMenu Binding: A binding to track the currently selected menu item, allowing smooth navigation and active state styling.

## 📱 Preview

The MenuRow component preview displays a sample menu item with a pre-selected menu state to allow for real-time preview and design adjustments in Xcode:
``` swift
struct MenuRow_Previews: PreviewProvider {
    static var previews: some View {
        MenuRow(item: menuItems[0], selectedMenu: .constant(.home))
            .environment(\.colorScheme, .light)  // Prevents preview issues due to Rive animations
    }
}
```
## ✨ Future Enhancements

	•	Additional Menu Styles: Implement more styles for different states (e.g., hover or inactive) for a more comprehensive menu experience.
	•	Customizable Animation: Allow for further customization of the Rive animation, such as duration or specific triggers.

