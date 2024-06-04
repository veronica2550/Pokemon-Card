import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pokemon/controller/pokemon_controller.dart';
import 'package:pokemon/view/pokemon_detail.dart';

class PokemonListView extends StatelessWidget {
  PokemonListView({super.key});
  final pokemonController = Get.put(PokemonController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              width: double.maxFinite,
              height:130,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREVMZdfAnSkYIc_0hIzuFUVWhGP-tOwjjSxw&s'),
                  fit: BoxFit.cover)
              ),
            ),
            Expanded(
              child: Obx(() {
                if(pokemonController.pokemon.isEmpty){
                  return Center(child: CircularProgressIndicator(),);
                }
                else{
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 4,
                  ),
                    itemCount: pokemonController.pokemon.length,
                    itemBuilder: (context, index){
                      return GestureDetector(
                        onTap: () {
                          final pokemon = pokemonController.pokemon[index];
                          Get.to(() => PokemonDetailView(pokemon: pokemon));
                        },
                        child: Card(
                          margin: EdgeInsets.all(12),
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 90,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage('${pokemonController.pokemon[index].imgurl}'),
                                      fit: BoxFit.cover)
                                  ),
                                ),
                                SizedBox(
                                  height: 28,
                                ),
                                Text('${pokemonController.pokemon[index].name}'),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  );
                }
              }),
            )
          ],
        ),
      ),
    );
  }
}