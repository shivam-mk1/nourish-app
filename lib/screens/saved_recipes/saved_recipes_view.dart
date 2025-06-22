import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'saved_recipes_model.dart';

class SavedRecipesView extends StatelessWidget {
  const SavedRecipesView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SavedRecipesViewModel(),
      child: Consumer<SavedRecipesViewModel>(
        builder: (context, model, child) {
          return Scaffold(
            body: Center(
              child: ElevatedButton(
                onPressed: () => context.go('/food_info'),
                child: Text('Go to Food Info'),
              ),
            ),
          );
        },
      ),
    );
  }
}
