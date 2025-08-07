import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavBarProvider extends StateNotifier<int> {
  NavBarProvider() : super(0);

  void setscreen(int index) {
    state = index;
  }
}

final navbarpro = StateNotifierProvider<NavBarProvider, int>(
  (_) => NavBarProvider(),
);
