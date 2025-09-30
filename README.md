# 🛒 Flutter Shopping App

A complete shopping application built with Flutter featuring user authentication, product display, and bilingual support (English/Arabic).

## 🌟 Features

### 1. **Aesthetic Welcome Screen**
- Clean, modern UI with app branding
- Two images display (local + online)
- Custom Suwannaphum font styling
- Sign Up and Sign In navigation buttons
- Language switcher (🌐) and Settings (⚙️) buttons

### 2. **User Authentication**
- **Sign Up Form**: Full name, email, password, confirm password
- **Sign In Form**: Email and password
- Input validation with localized error messages
- Smooth animated transitions after successful authentication

### 3. **Shopping Home Screen**
- Featured products carousel (PageView)
- Product grid (2 columns) with:
  - Product images
  - Product titles and prices
  - Add to cart functionality with snackbar feedback
- Hot offers section with 5 scrollable offers
- Language switcher available on all screens

### 4. **Bilingual Support (English/Arabic)**
- Complete Arabic localization using .arb files
- Language switching without app restart
- RTL support for Arabic text
- Localized validation messages
- Bilingual dialog interfaces

### 5. **Modern UI/UX**
- Material Design 3 components
- Custom color scheme with deep purple theme
- Smooth animations and transitions
- Responsive layout design
- Card-based product display

## 🛠️ Technical Implementation

### **Architecture**
- Modular widget structure
- StatefulWidget for language management
- Form validation with custom validators
- Navigation with PageRouteBuilder and FadeTransition

### **Dependencies**
```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_localizations:
    sdk: flutter
  intl: ^0.19.0
  cupertino_icons: ^1.0.8
```

### **Project Structure**
```
lib/
├── main.dart                 # App entry point with localization
├── screens/
│   ├── welcome_screen.dart   # Landing page with auth options
│   ├── signup_screen.dart    # User registration form
│   ├── signin_screen.dart    # User login form
│   ├── shopping_home_screen.dart # Main shopping interface
│   └── settings_screen.dart  # Language settings
├── widgets/
│   ├── product_card.dart     # Product display component
│   └── hot_offer_item.dart  # Offer display component
├── models/
│   └── product.dart         # Product data model
└── l10n/
    ├── app_en.arb          # English translations
    └── app_ar.arb          # Arabic translations
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (>=3.7.2)
- Dart SDK
- Android Studio / VS Code
- Android/iOS device or emulator

### Installation
1. Clone the repository:
```bash
git clone <repository-url>
cd flutter_shopping_app
```

2. Install dependencies:
```bash
flutter pub get
```

3. Generate localization files:
```bash
flutter gen-l10n
```

4. Run the app:
```bash
flutter run
```

## 📱 Usage

### **Language Switching**
- Tap the 🌐 language button in any app bar
- Select English 🇺🇸 or Arabic 🇸🇦 from the dialog
- Language changes instantly across the entire app

### **User Authentication**
1. **Sign Up**: Enter valid details (name must start with uppercase, email must contain @, password minimum 6 characters)
2. **Sign In**: Use existing credentials
3. Success dialog appears with smooth transition to shopping screen

### **Shopping Experience**
- Browse featured products in the carousel
- View product grid with prices
- Tap cart icon to add items (shows confirmation snackbar)
- Scroll through hot offers section

## 🎨 Design Features

- **Color Scheme**: Deep purple primary with Material 3 design
- **Typography**: Suwannaphum custom font family
- **Layout**: Responsive grid and list views
- **Animations**: Fade transitions between screens
- **Accessibility**: Proper semantic labels and contrast

## 🌍 Internationalization

The app supports two languages:
- **English**: Default language with LTR text direction
- **Arabic**: Full localization with RTL text direction

All user-facing text is externalized to .arb files for easy translation management.

## 📸 Screenshots

*Add screenshots of the app running on different screens and in both languages*

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🏆 Project Achievements

✅ Complete Flutter shopping app implementation  
✅ User authentication with form validation  
✅ Bilingual support (English/Arabic)  
✅ Modern Material Design 3 UI  
✅ Responsive product display  
✅ Smooth animations and transitions  
✅ Clean, modular code architecture  
✅ GitHub repository with documentation  

---

**Built with ❤️ using Flutter & Dart**