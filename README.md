---

# 📱 Swipeable Tinder-Like Cards (SwiftUI + RandomUser API)

This project demonstrates a Tinder-like swipe card interface built entirely with **SwiftUI**, using a clean **MVVM architecture**.
User data (profile picture, name, age, location, etc.) is fetched from the free [RandomUser API](https://randomuser.me).

---

## 🚀 Features

* Fetch random user profiles from API.
* Swipe **left** or **right** to discard cards (Tinder-style).
* Tap a card to open **detailed profile view**.
* **Reload** cards after finishing.
* Organized project structure with **Models, Networking, ViewModels, and Views**.

---

## 📂 Project Structure

```
SwipeCards/
├── SwipeCardsApp.swift                # App entry point (main SwiftUI App struct)
│
├── Helpers/
│   └── Constants.swift                # Centralized app constants
│
├── MVVM/Models/
│   ├── User.swift                     # User model with nested structs (Name, Picture, Location, etc.)
│   └── RandomUserResponse.swift       # Root response object for RandomUser API. Also call the API from this class
│
├── MVVM/ViewModels/
│   └── SwipeableCardsViewModel.swift  # State management + swipe logic
│
├── MVVM/Views/
│   ├── ContentView.swift              # Root view with header + swipe stack + controls
│   ├── SwipeableCardsView.swift       # Card stack with swipe gestures
│   └── UserDetailView.swift           # Detailed profile screen
│
├── MVVM/Views/CardView/
│   ├── FooterIcon.swift                # Show Footer Cross and Like Icons
│   ├── LoadingProgressView.swift       # Loading ProgressView
│   ├── ReloadButtonView.swift          # Reload Button
│   ├── Error.swift                     # Handles Error when error generates
│   ├── FinishedView.swift              # Handles when all the users have been seen
│   └── CardView.swift                  # UI for single profile card
│
├── MVVM/Views/CardViewControl/
│   ├── CardViewFooterControl.swift     # Show Cross and Like View at the Footer
│   └── CardViewScreenHeader.swift      # Show Header Swipe Cards
│
├── Networking/
│   ├── NetworkService.swift                # Handles API requests
│   ├── NetworkServiceManager+Ext.swift     # Resolve NetworkService Environment Injector
│   └── URLSessionNetworkService.swift      # Stores URLSession Network Service variables
│
├── Networking/Parser/
│   └── JSONParser.swift                # Handles JSON Parsing when decoding Response from the server
│
├── Networking/Environment/
│   ├── ProductionEnvironment.swift             # Handles App Environment for Networking like Production, Sandbox, Staging, etc.
│   └── ProductionGatewayEnvironment.swift      # Handles Product Gateway Environment for URL Session.
│
├── Resources/
│   └── Assets.xcassets                # App icons, colors, and image assets
│
├── Docs/
│   ├── swipe.png                      # Screenshot of swipe screen
│   ├── detail.png                     # Screenshot of detail screen
│   └── demo.mov                       # Screen recording demo
│
├── Preview Content/                   # SwiftUI preview mock data
│
└── README.md                          # Project documentation
```

---

## 📸 Screenshots

1. **Swipe Screen**
   ![Swipe Screen](Docs/swipe.png)

2. **Detail Screen**
   ![Detail Screen](Docs/detail.png)

---

## 🎥 Demo Recording

* [Demo Video](Docs/demo.mov)

(To record: Run in **Xcode Simulator** → **File > Record Screen** → Save in `Docs/demo.mov`.)

---

## 🛠️ Requirements

* iOS **16.0**
* Swift **5**
* Xcode **16**

---

## ▶️ Setup & Run

1. Clone this repository:

   ```bash
   git clone https://github.com/yourusername/SwipeCards.git
   Add Package https://github.com/KYC3909/NetworkServiceProvider.git
   Add Package https://github.com/KYC3909/UtilityProvider.git
   (These packages are `Public` for now, I will make them `Private` once evaluated)
   ```
2. Open `SwipeCards.xcodeproj` in Xcode.
3. Build & run on simulator or device.
4. Swipe cards left/right, tap for details, reload when finished.

---

## ✨ Future Improvements

* Add **like/dislike actions** connected to backend.
* Profile collapsing animation (image shrinks into nav bar).
* Dark mode theming.

---

## 📜 License

This project is free to use for learning or personal projects.
