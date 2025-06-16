import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
// Global Providers
import 'providers/auth_provider.dart';
import 'providers/theme_provider.dart';
import 'providers/db_provider.dart';
import 'providers/shared_preferences_provider.dart';
// Views
import 'screens/landing/landing_view.dart';
import 'screens/onboarding/onboarding_view.dart';
import 'screens/home/home_view.dart';
import 'screens/food_log/food_log_view.dart';
import 'screens/add_meal/add_meal_view.dart';
import 'screens/ai_recipes/ai_recipes_view.dart';
import 'screens/saved_recipes/saved_recipes_view.dart';
import 'screens/food_info/food_info_view.dart';
import 'screens/profile/profile_view.dart';
import 'screens/about_us/about_us_view.dart';

final _router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const LandingView()),
    GoRoute(path: '/landing', builder: (context, state) => const LandingView()),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingView(),
    ),
    GoRoute(path: '/home', builder: (context, state) => const HomeView()),
    GoRoute(
      path: '/food_log',
      builder: (context, state) => const FoodLogView(),
    ),
    GoRoute(
      path: '/add_meal',
      builder: (context, state) => const AddMealView(),
    ),
    GoRoute(
      path: '/ai_recipes',
      builder: (context, state) => const AiRecipesView(),
    ),
    GoRoute(
      path: '/saved_recipes',
      builder: (context, state) => const SavedRecipesView(),
    ),
    GoRoute(
      path: '/food_info',
      builder: (context, state) => const FoodInfoView(),
    ),
    GoRoute(path: '/profile', builder: (context, state) => const ProfileView()),
    GoRoute(path: '/about_us', builder: (context, state) => AboutUsView()),
  ],
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => DbProvider()),
        ChangeNotifierProvider(create: (_) => SharedPreferencesProvider()),
      ],
      child: MaterialApp.router(
        title: 'Nourish App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        routerConfig: _router,
      ),
    );
  }
}
