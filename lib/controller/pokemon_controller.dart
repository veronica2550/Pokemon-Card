import 'dart:math';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon/api/pokemon_api.dart';
import 'package:pokemon/model/model.dart';

class PokemonController extends GetxController with StateMixin<List<Pokemon>>{
  var pokemon = <Pokemon>[].obs;
  @override
  void onInit(){
    super.onInit();
    //여기서 api 호출
    fetchData();
  }

  Future<void> fetchData() async{
    final getConnect = GetConnect();
    
    try {
      final response = await getConnect.get('${PokemonApi.pokemon_api}?limit=1');
      final totalPokemon = response.body['count'];

      final randomIds = List.generate(20, (_) => Random().nextInt(totalPokemon) + 1);
      final tempPokemonList = <Pokemon>[];

      for (var id in randomIds) {
        final response = await getConnect.get('${PokemonApi.pokemon_api}$id');
        if (response.statusCode == 200) {
          tempPokemonList.add(Pokemon.fromJson(response.body));
        }
      }

      pokemon.assignAll(tempPokemonList);
      change(pokemon, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error('Error fetching Pokemon data: $e'));
    }
  }
}