import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon/controller/pokemon_controller.dart';
import 'package:pokemon/view/pokemon_detail.dart';

class PokemonListView extends GetView<PokemonController> {
  PokemonListView({super.key});
  final PokemonController pokemonController = Get.put(PokemonController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              width: double.maxFinite,
              height: 130,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREVMZdfAnSkYIc_0hIzuFUVWhGP-tOwjjSxw&s'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: pokemonController.obx(
                (state) => GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 4,
                  ),
                  itemCount: state?.length ?? 0,
                  itemBuilder: (context, index) {
                    final pokemon = state![index];
                    return GestureDetector(
                      onTap: () {
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
                                    image: NetworkImage(pokemon.imgurl),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: 28),
                              Text(pokemon.name),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                onLoading: Center(child: CircularProgressIndicator()),
                onEmpty: Center(child: Text('No Pokémon found')),
                onError: (error) => Center(child: Text('Error: $error')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
