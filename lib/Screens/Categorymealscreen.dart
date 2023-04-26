import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../models/dummy_data.dart';
import '../models/MealItems.dart';

class CatScreen extends StatelessWidget {
  // final String title;
  // CatScreen(this.title);
  static const mealscreenroute = '/categorymealscreen';
  @override
  Widget build(BuildContext context) {
    final resultargs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final String show = resultargs['title'] as String;
    final String label = resultargs['id'] as String;
    final categorymeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(label);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(show),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return Center(child: Mealitem(title:categorymeals[index].title, imageurl: categorymeals[index].imageUrl, affordability: categorymeals[index].affordability, complexity: categorymeals[index].complexity, duration: categorymeals[index].duration));
          },
          itemCount: categorymeals.length,
        ));
  }
}
