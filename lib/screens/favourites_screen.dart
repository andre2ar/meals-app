import 'package:flutter/material.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favouritesMeals;

  FavouritesScreen(this.favouritesMeals);

  @override
  Widget build(BuildContext context) {
    if (favouritesMeals.isEmpty) {
      return Center(
        child: Text("You have no favourites yet - start adding some!"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: favouritesMeals[index].id,
            title: favouritesMeals[index].title,
            imageUrl: favouritesMeals[index].imageUrl,
            duration: favouritesMeals[index].duration,
            complexity: favouritesMeals[index].complexity,
            affordability: favouritesMeals[index].affordability,
          );
        },
        itemCount: favouritesMeals.length,
      );
    }
  }
}
