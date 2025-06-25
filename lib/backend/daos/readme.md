# 🗂 DAOs – Data Access Objects

This directory contains all Data Access Objects (DAOs) responsible for handling CRUD operations using the local SQLite database (`sqflite` package). Each DAO encapsulates the database logic for a specific domain model, keeping the app modular, testable, and maintainable.

---

## 📦 Structure

| DAO File                    | Description                                      |
|-----------------------------|--------------------------------------------------|
| `user_dao.dart`             | Manages user profile data (name, age, gender, etc.) |
| `food_log_dao.dart`         | Handles daily meal/food logging entries          |
| `saved_recipe_dao.dart`     | Stores AI-generated recipes saved by the user    |
| `meal_preferences_dao.dart` | Stores user’s nutrition goals & macros           |

---

## 🛠 General Pattern

Each DAO typically exposes:
- `init()` or `createTable()` – to define table schema
- `insert()`
- `getAll()` or `queryById()`
- `update()`
- `deleteById()` or `clearAll()`

---

## 📚 Example Usage

```dart
final db = await DBService.instance.database;
final logs = await FoodLogDAO.getAll(db);
await FoodLogDAO.insert(db, logEntry);
```
