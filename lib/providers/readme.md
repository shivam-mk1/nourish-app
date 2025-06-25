# 🏷 Providers (State Management)

This directory holds all `ChangeNotifier` classes that expose app state to the UI.


## 🛠 Key Providers

- **`AuthProvider`**  (Not used as of now)
  - Sign‐in / Sign‐up methods  
  - Holds `User` object and auth status  

- **`DBProvider`**  
  - Fetches and caches local data via DAOs  
  - Notifies listeners on data changes  

- **`SharedPreferencesProvider`**  
  - Reads/writes small key‐value settings (e.g. onboarding complete flag)

- **`ThemeProvider`**  
  - Toggles between light and dark themes  
  - Persists choice in `SharedPreferences`


## 📦 Registering Providers

In `lib/providers.dart` (or your main top‐level file), combine all providers:

```dart
MultiProvider(
  providers: [
    ChangeNotifierProvider(create: (_) => AuthProvider()),
    ChangeNotifierProvider(create: (_) => DBProvider()),
    ChangeNotifierProvider(create: (_) => SharedPreferencesProvider()),
    ChangeNotifierProvider(create: (_) => ThemeProvider()),
  ],
  child: MyApp(),
);
```


## ➕ Adding a New Provider

- Create <feature>_provider.dart.
- Extend ChangeNotifier (or relevant base).
- Add CRUD/state logic.
- Register in lib/providers.dart.

## 📚 Testing Providers

Providers can be unit‐tested by:

- Creating an instance in a test
- Mocking underlying services (DAOs, Auth)
- Verifying state changes after method calls
