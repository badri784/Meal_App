import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/meal.dart';

class FavoraiteMealNotifier extends StateNotifier<List<Meal>> {
  FavoraiteMealNotifier() : super([]);

  bool onToggleFavorateMeal(Meal meal) {
    final isexisting = state.contains(meal);
    if (isexisting) {
      state = state.where((element) => element.id != meal.id).toList();
      return true;
    } else {
      state = [...state, meal];
      return false;
    }
  }
}

final favoraiteMealProvider =
    StateNotifierProvider<FavoraiteMealNotifier, List<Meal>>((ref) {
      return FavoraiteMealNotifier();
    });
