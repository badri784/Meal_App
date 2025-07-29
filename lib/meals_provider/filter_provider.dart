import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filters { glotenfree, vagen, vegetarian, actose }

class FilterNotifier extends StateNotifier<Map<Filters, bool>> {
  FilterNotifier()
    : super({
        Filters.glotenfree: false,
        Filters.actose: false,
        Filters.vagen: false,
        Filters.vegetarian: false,
      });

  void setfilter(Filters filter, bool isActive) {
    state = {...state, filter: isActive};
  }

  void setfilters(Map<Filters, bool> choosenfilter) {
    state = choosenfilter;
  }
}

final filterMealProvider =
    StateNotifierProvider<FilterNotifier, Map<Filters, bool>>(
      (ref) => FilterNotifier(),
    );
