enum Complexity {
  Simple,
  Challenging,
  Hard,
}

enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final Affordability affordability;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final Complexity complexity;
  final int duration;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;

  const Meal({
    this.id,
    this.categories,
    this.title,
    this.affordability,
    this.imageUrl,
    this.ingredients,
    this.steps,
    this.duration,
    this.complexity,
    this.isGlutenFree,
    this.isVegan,
    this.isVegetarian,
    this.isLactoseFree,
  });

  String get complexityText {
    switch(complexity) {
      case Complexity.Simple:
        return 'simple';
        case Complexity.Challenging:
        return 'challenging';
        case Complexity.Hard:
        return 'hard';
    }
  }

  String get affordableText {
    switch(affordability) {
      case Affordability.Affordable:
        return 'affordable';
        case Affordability.Luxurious:
        return 'luxurious';
        case Affordability.Pricey:
        return 'pricey';
    }
  }
}
