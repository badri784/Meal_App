import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/meals_provider/meals_provider.dart';

import '../model/meal.dart';
import '../screens/category_screen.dart';
import '../screens/filters_screen.dart';
import '../screens/meals_screen.dart';
import '../widget/main_drawer.dart';

const kInitialFilter = {
  Filters.glotenfree: false,
  Filters.actose: false,
  Filters.vagen: false,
  Filters.vegetarian: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int selectedpageindex = 0;

  final List<Meal> favoritesmeal = [];

  Map<Filters, bool> _selectedfilter = kInitialFilter;

  void showmassage(String massage) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(massage),
        showCloseIcon: true,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        backgroundColor: Theme.of(context).colorScheme.primary,
        clipBehavior: Clip.hardEdge,
      ),
    );
  }

  void onToggleFavorateMeal(Meal meal) {
    final isexisting = favoritesmeal.contains(meal);
    if (isexisting) {
      setState(() {
        favoritesmeal.remove(meal);
        showmassage("This meal wase removed!");
      });
    } else {
      setState(() {
        favoritesmeal.add(meal);
        showmassage("This meal wase added!");
      });
    }
  }

  void selectpage(int index) {
    setState(() {
      selectedpageindex = index;
    });
  }

  void setsecrren(String identfire) {
    Navigator.of(context).pop();

    if (identfire == 'filters') {
      Navigator.of(context)
          .push(
            MaterialPageRoute(
              builder: (ctx) => FiltersScreen(currentfilter: _selectedfilter),
            ),
          )
          .then(
            (value) =>
                setState(() => _selectedfilter = value ?? kInitialFilter),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsprovider);
    final List<Meal> availableMeals =
        meals.where((meal) {
          if (_selectedfilter[Filters.glotenfree]! && !meal.isGlutenFree) {
            return false;
          }
          if (_selectedfilter[Filters.actose]! && !meal.isLactoseFree) {
            return false;
          }
          if (_selectedfilter[Filters.vagen]! && !meal.isVegan) {
            return false;
          }
          if (_selectedfilter[Filters.vegetarian]! && !meal.isVegetarian) {
            return false;
          }
          return true;
        }).toList();

    Widget activesecrren = CategoryScreen(
      ontogglefavorite: onToggleFavorateMeal,
      availableMeals: availableMeals,
    );
    var activepagetitle = "Category";
    if (selectedpageindex == 1) {
      activesecrren = MealsScreen(
        meals: favoritesmeal,
        ontogglefavorite: onToggleFavorateMeal,
      );
      activepagetitle = "Favorites";
    }
    return Scaffold(
      appBar: AppBar(title: Text(activepagetitle), centerTitle: true),
      body: activesecrren,
      drawer: MainDrawer(onselectscreen: setsecrren),
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectpage,
        currentIndex: selectedpageindex,
        selectedFontSize: 16,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: "Category",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "favorate"),
        ],
      ),
    );
  }
}
