// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onselectscreen});

  final void Function(String identfire) onselectscreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context).colorScheme.primary.withOpacity(0.45),
                ],
              ),
            ),

            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  color: Theme.of(context).colorScheme.primary,
                  size: 45,
                ),
                const SizedBox(width: 12),
                Text(
                  "Fast Food",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              onselectscreen('meal');
            },
            title: Text(
              "Meals",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 20,
              ),
            ),
            leading: const Icon(Icons.filter, size: 30),
          ),
          ListTile(
            onTap: () {
              onselectscreen('filters');
            },
            internalAddSemanticForOnTap: true,
            title: Text(
              "Filters",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 20,
              ),
            ),
            leading: const Icon(Icons.settings, size: 30),
          ),
        ],
      ),
    );
  }
}
