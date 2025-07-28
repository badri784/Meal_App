// ignore_for_file: deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/model/meal.dart';

import '../meals_provider/favoraite_meal.dart';

class MealDetial extends ConsumerWidget {
  const MealDetial({super.key, required this.meal});
  final Meal meal;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              final wasadded = ref
                  .read(favoraiteMealProvider.notifier)
                  .onToggleFavorateMeal(meal);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    wasadded
                        ? "This meal wase removed!"
                        : "This meal wase added!",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 16,
                    ),
                  ),
                  backgroundColor: const Color.fromARGB(255, 36, 117, 189),
                  behavior: SnackBarBehavior.floating,
                  margin: const EdgeInsets.all(12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(12),
                  ),
                  elevation: 6,
                  duration: const Duration(seconds: 4),
                ),
              );
            },
            icon: const Icon(Icons.star),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image.network(
            //   meal.imageUrl,
            //   height: 300,
            //   width: double.infinity,
            //   fit: BoxFit.cover,
            // ),
            CachedNetworkImage(
              imageUrl: meal.imageUrl,
              height: 325,
              placeholder:
                  (context, url) =>
                      const Center(child: CircularProgressIndicator()),
              errorWidget:
                  (context, url, error) =>
                      const Center(child: Icon(Icons.error, size: 120)),
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Ingredients",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
            ),
            const SizedBox(height: 6),
            ...meal.ingredients.asMap().entries.map(
              (entry) => Column(
                children: [
                  ListTile(
                    title: Text(entry.value),
                    leading: CircleAvatar(child: Text('${entry.key + 1}')),
                  ),
                  const Divider(),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Steps",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
            ),
            const SizedBox(height: 6),
            ...meal.steps.asMap().entries.map((entry) {
              final index = entry.key;
              final step = entry.value;
              return Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(child: Text('${index + 1}')),
                    title: Text(step),
                  ),
                  const Divider(),
                ],
              );
            }),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
