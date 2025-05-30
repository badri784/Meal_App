// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:meal_app/model/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    required this.meal,
    super.key,
    required this.complexity,
    required this.affordability,
    required this.onselectedmeal,
  });
  final Meal meal;
  final Complexity complexity;
  final Affordability affordability;
  final void Function(Meal meal) onselectedmeal;

  String get complexityText {
    switch (complexity) {
      case Complexity.simple:
        return 'Simple';
      case Complexity.hard:
        return 'Hard';
      case Complexity.challenging:
        return 'Callenging';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.pricey:
        return 'Pricey';
      case Affordability.affordable:
        return 'Affordable';
      case Affordability.luxurious:
        return 'Luxurious';
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isdark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Card(
      margin: const EdgeInsets.all(12),
      // shape: BeveledRectangleBorder(
      //borderRadius: BorderRadius.circular(15)),
      // clipBehavior: Clip.antiAlias,
      elevation: 2,
      child: InkWell(
        onTap: () => onselectedmeal(meal),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: FadeInImage(
                    placeholder: MemoryImage(kTransparentImage),

                    //const AssetImage("image/quiz-logo.png"),
                    image: NetworkImage(meal.imageUrl),
                    imageErrorBuilder:
                        (context, error, stackTrace) =>
                            Image.asset("image/quiz-logo.png"),
                    fit: BoxFit.cover,
                  ),
                ),

                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 12,
                    ),
                    color: Colors.black26,

                    child: Column(
                      children: [
                        Text(
                          meal.title,
                          maxLines: 2,
                          softWrap: true,
                          overflow: TextOverflow.fade,
                          style: const TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        const Padding(padding: EdgeInsets.all(8.0)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 45,
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(2),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Padding(padding: EdgeInsets.all(8)),
                  Icon(
                    Icons.access_alarm_sharp,
                    color:
                        isdark
                            ? Theme.of(
                              context,
                            ).colorScheme.onBackground.withOpacity(0.85)
                            : Theme.of(context).colorScheme.onBackground,
                  ),
                  const SizedBox(width: 3),
                  Text(
                    "${meal.duration} min",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 18,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.work,

                    color:
                        isdark
                            ? Theme.of(
                              context,
                            ).colorScheme.onBackground.withOpacity(0.85)
                            : Theme.of(context).colorScheme.onBackground,
                  ),
                  const SizedBox(width: 4),
                  Row(
                    children: [
                      Text(
                        complexityText,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Icon(
                        Icons.paid,
                        color:
                            isdark
                                ? Theme.of(
                                  context,
                                ).colorScheme.onBackground.withOpacity(0.85)
                                : Theme.of(context).colorScheme.onBackground,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        affordabilityText,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
