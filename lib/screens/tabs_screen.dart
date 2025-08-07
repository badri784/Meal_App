import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/meals_provider/meals_provider.dart';

import '../meals_provider/favoraite_meal.dart';
import '../meals_provider/filter_provider.dart';
import '../model/meal.dart';
import '../screens/category_screen.dart';
import '../screens/filters_screen.dart';
import '../screens/meals_screen.dart';
import '../widget/main_drawer.dart';
import '../meals_provider/nav_bar_provider.dart';

// const kInitialFilter = {
//   Filters.glotenfree: false,
//   Filters.actose: false,
//   Filters.vagen: false,
//   Filters.vegetarian: false,
// };

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  void setsecrren(String identfire) {
    Navigator.of(context).pop();

    if (identfire == 'filters') {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (ctx) => const FiltersScreen()));
    }
  }

  int selectedpageindex = 0;
  @override
  Widget build(BuildContext context) {
    final mealProvider = ref.watch(mealsprovider);
    final List<Meal> availableMeals =
        mealProvider.where((meal) {
          final state = ref.watch(filterMealProvider);
          if (state[Filters.glotenfree]! && !meal.isGlutenFree) {
            return false;
          }
          if (state[Filters.actose]! && !meal.isLactoseFree) {
            return false;
          }
          if (state[Filters.vagen]! && !meal.isVegan) {
            return false;
          }
          if (state[Filters.vegetarian]! && !meal.isVegetarian) {
            return false;
          }
          return true;
        }).toList();

    Widget activesecrren = CategoryScreen(availableMeals: availableMeals);
    var activepagetitle = "Category";
    if (selectedpageindex == 1) {
      final favoritesmeal = ref.watch(favoraiteMealProvider);
      activesecrren = MealsScreen(meals: favoritesmeal);
      activepagetitle = "Favorites";
    }
    return Scaffold(
      appBar: AppBar(title: Text(activepagetitle), centerTitle: true),
      body: activesecrren,
      drawer: MainDrawer(onselectscreen: setsecrren),
      bottomNavigationBar: BottomNavigationBar(
        onTap: ref.read(navbarpro.notifier).setscreen,
        currentIndex: selectedpageindex,
        selectedFontSize: 16,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: "Category",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star, applyTextScaling: true),
            label: "favorate",
          ),
        ],
      ),
    );
  }
}
