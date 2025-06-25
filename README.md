# 🍎 Nourish App

Nourish is a cross-platform Flutter app designed to help users track their food intake, monitor their macros, scan food barcodes, and discover AI-powered healthy recipes. Built with ❤️ by GDG contributors.

---

## 🚀 Features

- 📋 Onboarding flow (gender, goals, macros, body metrics)
- 🏠 Home dashboard with nutrition summary
- 🍛 Food logging by meal and date
- 📅 Calendar view of logged meals
- 🔍 AI-generated and saved recipes
- 📦 Barcode scanning to fetch food info
- 👤 Profile management and BMR data
- 🌓 Light and Dark mode support

---

## 🏗 Project Structure

```

lib/
├── backend/               # API handlers or backend simulation
├── providers/             # State management using Provider
├── screens/               # Feature-based screen folders
│   └── onboarding/        # Onboarding has sub-screens
├── widgets/               # Reusable UI components
├── router.dart            # App navigation
├── providers.dart            # Global Providers
└── main.dart              # Entry point

````

---

### Setup Instructions

```bash
git clone https://github.com/opxdelwin/nourish-app.git
cd nourish-app
flutter pub get
flutter run
````

> 🔐 If using barcode scanner: ensure camera permission is granted in Android/iOS manifest.

---

## 🧪 Running Tests

```bash
flutter test
```

Unit tests are primarily found under `test/models/` and widget tests under `test/widgets/`.

---

## 🤝 Contribution Guide

We love ICs and contributors! Please follow these steps:

1. Check existing GitHub issues or create a new one.
2. Fork and clone the repo.
3. Create a new branch: `git checkout -b feature/my-feature`
4. Commit your changes with clear messages.
5. Submit a PR and link to your issue.

### Folder Naming Conventions

* All screens: `snake_case_view.dart`
* Models and Providers: `feature_model.dart`, `feature_provider.dart`
* Widgets: grouped under `widgets/` in categorized folders

---

## 📦 Tech Stack

* **Flutter** for frontend
* **Provider** for state management
* **Hive / SharedPreferences** for local storage
* **fl_chart** for macro pie charts
* **mobile_scanner** for barcode scanning
* **GoRouter / Navigator 2.0** for routing

---

## 👥 Team & Credits

Made with ❤️ by the GDG KIIT team and open-source contributors.
Special thanks to designers, ICs, and maintainers.

---

## 📄 License

[MIT License](LICENSE)

---

## 🌐 About GDG KIIT

This project is built by and for the GDG KIIT community to promote open-source learning, collaboration, and developer growth. Check out more about us at [gdg.community.dev](https://gdg.community.dev)
