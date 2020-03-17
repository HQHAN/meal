import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';

class MealListScreen extends StatefulWidget {
  static const String route_name = "/categories-meals";

  final List<Meal> meals;

  MealListScreen(this.meals);

  @override
  _MealListScreenState createState() => _MealListScreenState();
}

class _MealListScreenState extends State<MealListScreen> {
  String _categoryTitle;
  List<Meal> _filteredMeals;
  bool _isInitialLoaded = false;

  List<Meal> _getMealsFilterByCategoty(String cid) {
    return widget.meals.where((meal) {
      return meal.categories.contains(cid);
    }).toList();
  }

  void _onDeleteHandler(String mealId) {
    print('$mealId _onDeleteHandler');
    setState(() {
      _filteredMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_isInitialLoaded) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      _categoryTitle = routeArgs['title'];
      final String categoryId = routeArgs['id'];
      _filteredMeals = _getMealsFilterByCategoty(categoryId);
      _isInitialLoaded = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, position) {
          return MealItem(_filteredMeals[position], _onDeleteHandler);
        },
        itemCount: _filteredMeals.length,
      ),
    );
  }
}
