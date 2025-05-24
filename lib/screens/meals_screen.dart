import 'package:flutter/material.dart';
import 'package:meal_app/model/meal.dart';

import '../widget/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.tital, required this.meals});
  final String tital;
  final List<Meal> meals;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(tital), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(12),

        child: SingleChildScrollView(
          child: Column(
            children: meals.map((meal) => MealItem(meal: meal)).toList(),
          ),
        ),
      ),
    );
  }
}
