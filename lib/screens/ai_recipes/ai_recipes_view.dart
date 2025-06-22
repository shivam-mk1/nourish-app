import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'ai_recipes_model.dart';

class AiRecipesView extends StatelessWidget {
  const AiRecipesView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AiRecipesViewModel(),
      child: Consumer<AiRecipesViewModel>(
        builder: (context, model, child) {
          return Scaffold(
            body: Center(
              child: ElevatedButton(
                onPressed: () => context.go('/saved_recipes'),
                child: Text('Go to Saved Recipes'),
              ),
            ),
          );
        },
      ),
    );
  }
}
