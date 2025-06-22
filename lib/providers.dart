import 'package:provider/provider.dart';

// Global Providers
import 'providers/auth_provider.dart';
import 'providers/theme_provider.dart';
import 'providers/db_provider.dart';
import 'providers/shared_preferences_provider.dart';

final providers = [
  ChangeNotifierProvider(create: (_) => AuthProvider()),
  ChangeNotifierProvider(create: (_) => ThemeProvider()),
  ChangeNotifierProvider(create: (_) => DbProvider()),
  ChangeNotifierProvider(create: (_) => SharedPreferencesProvider()),
];
