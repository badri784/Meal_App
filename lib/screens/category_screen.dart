import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../model/meal.dart';
import '../widget/category_grid_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.ontogglefavorite});
  final void Function(Meal meal) ontogglefavorite;

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        childAspectRatio: 10 / 9,
      ),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            ontogglefavorite: ontogglefavorite,
          ),
      ],
    );
  }
}
