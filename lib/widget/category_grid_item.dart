// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:meal_app/model/category.dart';
import '../model/meal.dart';
import '../screens/meals_screen.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    super.key,

    required this.category,
    required this.ontogglefavorite,
    required this.availableMeals,
  });
  final Category category;
  final void Function(Meal meal) ontogglefavorite;
  final List<Meal> availableMeals;
  @override
  Widget build(BuildContext context) {
    /* InkWell and GestureDector is  the same function but have a small deffrentو 
    "splashColor" is not exthest in GestureDector so we think! 
    when he tap on the widget of (Meal App) he found any action! 
    */
    return InkWell(
      // GestureDetector
      onTap: () {
        final List<Meal> dummymeals =
            availableMeals
                .where((element) => element.categories.contains(category.id))
                .toList();

        Navigator.of(context).push(
          /*  Here you can use pushReplacement
          لما تيجي تشتغل محتاج تعمل الصفحه اللي فوق ملهاش علاقه اصلا بالصفحه اللي تحت تقدر  ساعتها تعمل 
          pushReplacement 
          ساعتها اصلا مش هيعمل back botton 
          اما لو الصفحه اللي فوق مرتبطه باللي تحت تقدر تستخدم دي 
          */
          MaterialPageRoute(
            builder:
                (ctx) => MealsScreen(
                  tital: category.title,
                  meals: dummymeals,
                  ontogglefavorite: ontogglefavorite,
                ),
          ),
        );
      },
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [category.color, category.color.withOpacity(0.59)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
      ),
    );
  }
}
