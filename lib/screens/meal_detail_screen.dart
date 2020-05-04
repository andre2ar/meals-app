import 'package:flutter/material.dart';
import 'package:mealsapp/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const String route = '/meal-detail';
  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      width: double.infinity,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
              Column(
                children: <Widget>[
                  ...(selectedMeal.ingredients.map((ingredient) {
                    return Card(
                      color: Theme.of(context).accentColor,
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        child: Text(ingredient),
                      ),
                    );
                  }).toList())
                ],
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(
              Column(
                children: <Widget>[
                  ...(selectedMeal.steps.asMap().entries.map((entry) {
                    int index = entry.key;
                    String step = entry.value;

                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text('# ${(index + 1)}'),
                          ),
                          title: Text(
                            step,
                          ),
                        ),
                        Divider()
                      ],
                    );
                  }).toList())
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          Navigator.of(context).pop(mealId);
        },
      ),
    );
  }
}
