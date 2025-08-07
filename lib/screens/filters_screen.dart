// ignore_for_file: deprecated_member_use
// import 'package:meal_app/screens/tabs_screen.dart';
// import 'package:meal_app/widget/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../meals_provider/filter_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activefilter = ref.watch(filterMealProvider);
    return Scaffold(
      appBar: AppBar(title: const Text("Your Filters"), centerTitle: true),

      body: Column(
        children: [
          SwitchListTile(
            title: Text(
              "Gluten-free",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 18,
              ),
            ),
            contentPadding: const EdgeInsets.only(left: 30, right: 20, top: 10),
            subtitle: Text(
              "Only include gluten-free meals",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 18,
              ),
            ),
            value: activefilter[Filters.glotenfree]!,
            onChanged: (bool value) {
              ref
                  .read(filterMealProvider.notifier)
                  .setfilter(Filters.glotenfree, value);
            },
          ),
          SwitchListTile(
            title: Text(
              "Vegan",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 18,
              ),
            ),
            contentPadding: const EdgeInsets.only(left: 30, right: 20, top: 10),
            subtitle: Text(
              "Only include vagen meals",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 18,
              ),
            ),
            value: activefilter[Filters.vagen]!,
            onChanged: (bool value) {
              ref
                  .read(filterMealProvider.notifier)
                  .setfilter(Filters.vagen, value);
            },
          ),
          SwitchListTile(
            title: Text(
              "Vegetarian",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 18,
              ),
            ),
            contentPadding: const EdgeInsets.only(left: 30, right: 20, top: 10),
            subtitle: Text(
              "Only include Vegetarian-free meals",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 18,
              ),
            ),
            value: activefilter[Filters.vegetarian]!,
            onChanged: (bool value) {
              ref
                  .read(filterMealProvider.notifier)
                  .setfilter(Filters.vegetarian, value);
            },
          ),
          SwitchListTile(
            title: Text(
              "Lactis-Free",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 18,
              ),
            ),
            contentPadding: const EdgeInsets.only(left: 30, right: 20, top: 10),
            subtitle: Text(
              "Only include Lactis-free meals",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 18,
              ),
            ),
            value: activefilter[Filters.actose]!,
            onChanged: (bool value) {
              ref
                  .read(filterMealProvider.notifier)
                  .setfilter(Filters.actose, value);
            },
          ),
        ],
      ),
    );
  }
}
