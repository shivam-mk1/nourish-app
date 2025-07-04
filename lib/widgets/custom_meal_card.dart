import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// A custom widget that displays meal cards for different meal types.
///
/// This widget shows breakfast, lunch, dinner, and snack meals with their
/// respective calories and quantities in an organized card layout.
/// Any particular meal type is optional
///
/// Example usage:
/// ```dart
/// CustomMealCard(
///   breakfastMeals: {'Oatmeal': {'quantity': '1 bowl', 'calories': 150}},
///   lunchMeals: {'Sandwich': {'quantity': '1 piece', 'calories': 300}},
///   dinnerMeals: {'Rice': {'quantity': '1 cup', 'calories': 200}},
///   snackMeals: {'Apple': {'quantity': '1 piece', 'calories': 80}},
///   onTap : (mealType, meals) {
///     print('Tapped on $mealType: $meals');
///   },
/// )

class CustomMealCard extends StatefulWidget {
  final Map<String, dynamic>? breakfastMeals,
      lunchMeals,
      dinnerMeals,
      snackMeals;
  final Function(String mealType, Map<String, dynamic> meals)? onTap;
  const CustomMealCard({
    super.key,
    this.breakfastMeals,
    this.lunchMeals,
    this.dinnerMeals,
    this.snackMeals,
    this.onTap,
  });

  @override
  State<CustomMealCard> createState() => _CustomMealCardState();
}

class _CustomMealCardState extends State<CustomMealCard> {
  @override
  Widget build(BuildContext context) {
    // This widget is used to display a list of meal cards.
    Size s = MediaQuery.sizeOf(context);
    return Column(
      children: [
        buildMealCardItem(
          "assets/images/breakfast.svg",
          "Breakfast",
          widget.breakfastMeals,
        ),
        SizedBox(height: s.height * 0.02),
        buildMealCardItem(
          "assets/images/lunch.svg",
          "Lunch",
          widget.lunchMeals,
        ),
        SizedBox(height: s.height * 0.02),
        buildMealCardItem(
          "assets/images/dinner.svg",
          "Dinner",
          widget.dinnerMeals,
        ),
        SizedBox(height: s.height * 0.02),
        buildMealCardItem(
          "assets/images/snacks.svg",
          "Snacks",
          widget.snackMeals,
        ),
      ],
    );
  }

  /// Builds a single meal card item with icon, title, and calorie information.
  ///
  /// [imgAsset] - Path to the SVG icon asset
  /// [mealType] - Display name for the meal type
  /// [meals] - Map containing meal data with calories and quantities

  Widget buildMealCardItem(
    String imgAsset,
    String mealType,
    Map<String, dynamic>? meals,
  ) {
    // This function builds a single meal card item.
    if (meals == null || meals.isEmpty) return SizedBox.shrink();
    Size s = MediaQuery.sizeOf(context);
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(imgAsset, width: 20, height: 20),
            SizedBox(width: s.width * 0.03),
            Text(mealType, style: TextStyle(fontSize: 24)),
            Spacer(),
            Text(
              getTotalCalories(meals),
              style: TextStyle(color: Color(0xff6F60EF)),
            ),
          ],
        ),
        Divider(thickness: 2, color: Colors.black),
        Padding(
          padding: EdgeInsets.only(left: s.width * 0.02),
          child: buildMealTypeItems(meals),
        ),
      ],
    );
  }

  buildMealTypeItems(Map<String, dynamic> meals, {VoidCallback? onTap}) {
    // This function builds the list of meals for a specific meal type.
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: meals.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: onTap,
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    meals.keys.elementAt(index),
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "Qty : ${meals[meals.keys.elementAt(index)]['quantity']}",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              Spacer(),
              Text("${meals[meals.keys.elementAt(index)]['calories']} kcal"),
            ],
          ),
        );
      },
    );
  }

  // This function calculates the total calories for a given meal type.
  String getTotalCalories(Map<String, dynamic> meals) {
    num totalCalories = 0;
    meals.forEach((key, value) {
      totalCalories += value['calories'];
    });
    return "$totalCalories kcal";
  }
}
