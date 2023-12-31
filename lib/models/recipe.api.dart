import 'dart:convert';
import 'package:recipe/models/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeAPI {
  static getRecipe() async {
    var uri = Uri.https("yummly2.p.rapidapi.com", "/feeds/list",
        {"limit": '24', "start": '0', 'tag': 'list.recipe.popular'});

    final response = await http.get(uri, headers: {
      'X-RapidAPI-Key': 'be522a4f51mshdca588f5c313812p1f1b03jsncea1af2c8244',
      'X-RapidAPI-Host': 'yummly2.p.rapidapi.com',
      'useQueryString': 'true'
    });
    Map data = jsonDecode(response.body);
    List temp = [];

    for (var i in data["feed"]) {
      temp.add(i["content"]["detail"]);

      return Recipe.recipesFromSnapshot(temp);
    }
  }
}
