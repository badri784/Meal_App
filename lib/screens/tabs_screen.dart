import 'package:flutter/material.dart';
import 'package:meal_app/model/meal.dart';
import 'package:meal_app/screens/category_screen.dart';
import 'package:meal_app/screens/meals_screen.dart';

import '../widget/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int selectedpageindex = 0;

  final List<Meal> favoritesmeal = [];

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
        showmassage("This meal wase removed");
      });
    } else {
      setState(() {
        favoritesmeal.add(meal);
        showmassage("This meal wase added");
      });
    }
  }

  void selectpage(int index) {
    setState(() {
      selectedpageindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activesecrren = CategoryScreen(
      ontogglefavorite: onToggleFavorateMeal,
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
      drawer: const MainDrawer(),
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
