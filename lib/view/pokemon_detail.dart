import 'package:flutter/material.dart';
import 'package:pokemon/model/model.dart';

class PokemonDetailView extends StatelessWidget {
  final Pokemon pokemon;

  PokemonDetailView({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.red, // 그라데이션의 시작 색상
              Colors.black.withOpacity(0.9), 
              Colors.white, // 그라데이션의 종료 색상
            ],
            begin: Alignment.topCenter, // 그라데이션의 시작 위치
            end: Alignment.bottomCenter, // 그라데이션의 종료 위치
            stops: [0.0, 0.5, 0.65], // 그라데이션의 위치를 설정합니다. (시작: 0.0, 중간: 0.5, 종료: 0.7)
            tileMode: TileMode.clamp, // 그라데이션 반복 방법 설정
          ),
        ),
        child: Center(
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(pokemon.imgurl, height: 200, width: 200, fit: BoxFit.cover),
                SizedBox(height: 20),
                Text('ID: ${pokemon.id}', style: TextStyle(fontSize: 18)),
                SizedBox(height: 10),
                Text(pokemon.name, style: TextStyle(fontSize: 24)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
