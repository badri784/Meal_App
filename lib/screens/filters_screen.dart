// ignore_for_file: deprecated_member_use
// import 'package:meal_app/screens/tabs_screen.dart';
// import 'package:meal_app/widget/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentfilter});
  final Map<Filters, bool> currentfilter;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

enum Filters { glotenfree, vagen, vegetarian, actose }

class _FiltersScreenState extends State<FiltersScreen> {
  bool glotenfreefilter = false;
  bool isvagen = false;
  bool vegetarian = false;
  bool actoseFree = false;
  @override
  void initState() {
    super.initState();
    glotenfreefilter = widget.currentfilter[Filters.glotenfree]!;
    actoseFree = widget.currentfilter[Filters.actose]!;
    isvagen = widget.currentfilter[Filters.vagen]!;
    vegetarian = widget.currentfilter[Filters.vegetarian]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Filters"), centerTitle: true),
      // drawer: MainDrawer(
      //   onselectscreen: (identfire) {
      //     Navigator.of(context).pushReplacement(
      //       MaterialPageRoute(builder: (ctx) => const TabsScreen()),
      //     );
      //   },
      // ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filters.glotenfree: glotenfreefilter,
            Filters.actose: actoseFree,
            Filters.vagen: isvagen,
            Filters.vegetarian: vegetarian,
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              title: Text(
                "Gluten-free",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 18,
                ),
              ),
              contentPadding: const EdgeInsets.only(
                left: 30,
                right: 20,
                top: 10,
              ),
              subtitle: Text(
                "Only include gluten-free meals",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 18,
                ),
              ),
              value: glotenfreefilter,
              onChanged: (bool value) {
                setState(() {
                  glotenfreefilter = value;
                });
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
              contentPadding: const EdgeInsets.only(
                left: 30,
                right: 20,
                top: 10,
              ),
              subtitle: Text(
                "Only include vagen meals",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 18,
                ),
              ),
              value: isvagen,
              onChanged: (bool value) {
                setState(() {
                  isvagen = value;
                });
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
              contentPadding: const EdgeInsets.only(
                left: 30,
                right: 20,
                top: 10,
              ),
              subtitle: Text(
                "Only include Vegetarian-free meals",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 18,
                ),
              ),
              value: vegetarian,
              onChanged: (bool value) {
                setState(() {
                  vegetarian = value;
                });
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
              contentPadding: const EdgeInsets.only(
                left: 30,
                right: 20,
                top: 10,
              ),
              subtitle: Text(
                "Only include Lactis-free meals",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 18,
                ),
              ),
              value: actoseFree,
              onChanged: (bool value) {
                setState(() {
                  actoseFree = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
