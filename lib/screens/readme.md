
# 🖥 Screens (UI Layer)

Each feature in the app has its own screen folder, containing the view and its accompanying model (MVVM‐style).


## 🧩 Conventions

- **`<feature>_view.dart`**  
  Holds the `StatelessWidget` or `StatefulWidget` that renders the UI.

- **`<feature>_model.dart`**  
  Contains business logic and state for the screen (e.g. input validation, view callbacks).

- **Nested Screens**  
  If a feature has multiple steps (e.g. onboarding), group sub‐screens under `screens/`.


## ➕ Adding a New Screen

1. Create a folder `lib/screens/<new_feature>/`.
2. Scaffold:
   - `<new_feature>_view.dart`
   - `<new_feature>_model.dart`
3. Register route in `lib/router.dart`.
4. Wire up provider or model in `lib/providers.dart` (if a global state is required).

---

## 🎨 Styling & Theming

- Use shared widgets (from `lib/widgets/`) for buttons, text fields, chips, etc.
- Consume theme values from `ThemeProvider` to ensure consistency.

