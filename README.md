# QuickSell – Local Marketplace Mobile App

A Flutter-based mobile application that allows users to buy and sell items within their local community. QuickSell connects local buyers and sellers, making it easy to find, list, and purchase items nearby.

**Platform:** Android  
**Status:** ✅ All screens and core features functional

---
---

## ✨ Features

### Core Features (Fully Implemented)
- ✅ **User Authentication** – Secure registration and login using Firebase Authentication
- ✅ **Product Listing** – Post items with name, price, description, and image
- ✅ **Browse & Search** – Search products in real time by name
- ✅ **Chat System** – Direct messaging between buyers and sellers
- ✅ **Image Upload** – Upload product images using Firebase Storage

---

## 🛠️ Technology Stack

| Layer | Technology |
|-------|-----------|
| Framework | Flutter (Dart) |
| Authentication | Firebase Authentication |
| Database | Cloud Firestore |
| Image Storage | Firebase Storage |
| IDE | VS Code |
| Platform | Android |

### Key Dependencies
```yaml
firebase_core: ^4.9.0
firebase_auth: ^6.5.1
cloud_firestore: ^6.4.1
firebase_storage: ^13.4.1
image_picker: ^1.2.2
```

---

## 📁 Project Structure

```
lib/
├── main.dart                        # App entry point & Firebase init
├── firebase_options.dart            # Firebase configuration
└── screens/
    ├── login_screen.dart            # ✅ Login with email & password
    ├── register_screen.dart         # ✅ New user registration
    ├── home_screen.dart             # ✅ Product browsing & search
    ├── add_product_screen.dart      # ✅ Product creation with image
    ├── chat_screen.dart             # ✅ Real-time buyer-seller chat
    └── demo_chat_screen.dart        # ✅ Demo chat for testing
```

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK 3.0+
- Dart SDK
- Firebase project (free Spark plan)
- Android device or emulator
- VS Code or Android Studio

### Installation

1. **Clone the repository**
```bash
git clone https://github.com/k-shoki/Quicksell.git
cd Quicksell/quicksell
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Configure Firebase**
   - Create a Firebase project at [Firebase Console](https://console.firebase.google.com)
   - Enable Email/Password Authentication
   - Create a Firestore database in test mode
   - Download `google-services.json` and place it in `android/app/`
   - Run `flutterfire configure` to generate `firebase_options.dart`

4. **Run the app**
```bash
# For Android
flutter run

# For Chrome (web testing)
flutter run -d chrome --web-port 3000
```

---

## 🔥 Firebase Setup

### Required Services
- **Authentication** – Email/Password enabled
- **Cloud Firestore** – Collections: `products`, `chats`
- **Firebase Storage** – For product images

### Firestore Collections

**Products Collection**
```
products/
├── {productId}
│   ├── name: string
│   ├── price: string
│   ├── description: string
│   ├── imageUrl: string
│   ├── sellerId: string
│   ├── sellerName: string
│   └── createdAt: timestamp
```

**Chats Collection**
```
chats/
├── {chatId}
│   └── messages/
│       └── {messageId}
│           ├── text: string
│           ├── senderId: string
│           ├── senderName: string
│           └── createdAt: timestamp
```

---

## 📲 Screens Overview

### 1. Login Screen ✅
- Email and password input
- Navigate to Register screen
- Firebase Authentication

### 2. Register Screen ✅
- Full name, email, password inputs
- Creates Firebase account
- Navigates back to Login

### 3. Home Screen ✅
- Grid view of available products
- Real-time search bar
- Logout button
- Floating action button to add products

### 4. Add Product Screen ✅
- Product name, price, description fields
- Image picker from gallery
- Uploads to Firebase Storage
- Saves to Firestore

### 5. Chat Screen ✅
- Shows product info at top
- Real-time messages via Firestore
- Sends and receives messages instantly

---

## 🎯 Project Requirements Fulfilled

| # | Feature | Status |
|---|---------|--------|
| 1 | User Authentication | ✅ Done |
| 2 | Product Listing | ✅ Done |
| 3 | Browse & Search | ✅ Done |
| 4 | Chat System | ✅ Done |
| 5 | Image Upload | ✅ Done |

---

## 🔮 Future Enhancements

- 🔄 Location-based filtering
- 🔄 User profiles and ratings
- 🔄 Push notifications
- 🔄 Payment integration
- 🔄 Product categories
- 🔄 Favorites/wishlist

---

## 👩‍💻 Developer

**Kidist Beyene**  
GitHub: [@k-shoki](https://github.com/k-shoki)

---

## 📄 License

This project is licensed under the MIT License.

---

*QuickSell – Buy Local. Sell Fast. Connect Directly. 🛍️*
