import 'package:flutter/material.dart';
import 'package:julyfultterproject/Provider/model.dart';

class RecipeDetailsPage extends StatelessWidget {
  final Recipe recipe;
  RecipeDetailsPage({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(recipe.name ?? 'recipe'),
      ),
      body: SingleChildScrollView(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if(recipe.image != null)
                Image.network(recipe.image!,height: 200,
                width: double.infinity,
                fit: BoxFit.cover,),
              SizedBox(height: 16.0,),
              Text('Ingrediants:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),
              ),
              SizedBox(height: 8.0,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(recipe.ingredients?.length ?? 0,(index)=>Text("${recipe.ingredients![index]}"),
              )),
              SizedBox(height: 16.0,),
              Text("Instaction",style:
                TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),),
              SizedBox(height: 8.0,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                  List.generate(recipe.instructions?.length ?? 0, (index)=> Text('${index + 1},${recipe.instructions![index]}')),
              )
            ],
          ),
        ),
      );
  }
}
