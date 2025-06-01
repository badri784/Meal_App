import 'package:flutter/material.dart';
import 'package:meal_app/model/meal.dart';
import 'package:meal_app/screens/meal_detial_screen.dart';
import '../widget/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.tital,
    required this.meals,
    required this.ontogglefavorite,
  });

  final String? tital;
  final List<Meal> meals;
  final void Function(Meal meal) ontogglefavorite;

  @override
  Widget build(BuildContext context) {
    return tital == null
        ? content(context)
        : Scaffold(
          appBar: AppBar(title: Text(tital!), centerTitle: true),
          body: Padding(
            padding: const EdgeInsets.all(12),

            child: content(context),
          ),
        );
  }

  SingleChildScrollView content(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children:
            meals
                .map(
                  (meal) => MealItem(
                    meal: meal,
                    complexity: meal.complexity,
                    affordability: meal.affordability,
                    onselectedmeal: (Meal meal) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (ctx) => MealDetial(
                                meal: meal,
                                ontogglefavorite: ontogglefavorite,
                              ),
                        ),
                      );
                    },
                  ),
                )
                .toList(),
      ),
    );
  }
}
