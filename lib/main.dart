import 'package:flutter/material.dart';
import 'package:meal_app/models/dummy_categories.dart';
import 'package:meal_app/screens/category_screen.dart';
import 'package:meal_app/screens/filter_screen.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';
import 'package:meal_app/screens/meal_list_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';

import 'models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _currentFilters = {
    'gluten': false,
    'vegan': false,
    'vegeterian': false,
    'lactos': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> changed) {
    setState(() {
      _currentFilters = changed;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_currentFilters['gluten'] && meal.isGlutenFree) return false;
        if (_currentFilters['vegan'] && meal.isVegan) return false;
        if (_currentFilters['vegeterian'] && meal.isVegetarian) return false;
        if (_currentFilters['lactos'] && meal.isLactoseFree) return false;
        return true;
      }).toList();
    });
  }

  void _onToggleFavorite(String mealId) {
    final Meal found = _favoriteMeals.firstWhere((item) {
      return item.id == mealId;
    }, orElse: () => null);

    if (found != null) {
      setState(() {
        _favoriteMeals.remove(found);
        print(_favoriteMeals);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((item) => item.id == mealId));
        print(_favoriteMeals);
      });
    }
  }

  bool _isFavoriteItem(String id) {
    return _favoriteMeals.any((item) => item.id == id );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                body1: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                body2: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                title: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                ),
              )),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabScreen(_favoriteMeals),
        MealListScreen.route_name: (ctx) => MealListScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(_onToggleFavorite, _isFavoriteItem),
        FilterScreeen.routeName: (ctx) => FilterScreeen(
              _setFilters,
              currentSetting: _currentFilters,
            ),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        return MaterialPageRoute(
          builder: (ctx) => TabScreen(_favoriteMeals),
        );
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => CategoryScreen(),
        );
      },
    );
  }
}
