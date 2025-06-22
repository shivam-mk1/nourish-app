import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'food_info_model.dart';

class FoodInfoView extends StatelessWidget {
  const FoodInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FoodInfoViewModel(),
      child: Consumer<FoodInfoViewModel>(
        builder: (context, model, child) {
          return Scaffold(
            body: Center(
              child: ElevatedButton(
                onPressed: () => context.go('/profile'),
                child: Text('Go to Profile'),
              ),
            ),
          );
        },
      ),
    );
  }
}
