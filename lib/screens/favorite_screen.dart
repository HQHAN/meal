import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favorites;

  FavoriteScreen(this.favorites);

  @override
  Widget build(BuildContext context) {
    if (favorites.isEmpty) {
      return Center(
        child: Text('No Favorite!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, position) {
          return MealItem(favorites[position], null);
        },
        itemCount: favorites.length,
      );
    }
  }
}
