import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Pokedex'),
        ),
        body: const PokemonCarousel(),
      ),
    );
  }
}

class PokemonCarousel extends StatelessWidget {
  const PokemonCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        enableInfiniteScroll: false,
        enlargeCenterPage: true,
      ),
      items: [
        _buildPokemonCard("Bulbasaur", "Planta", "assets/images/bulbasaur.png"),
        _buildPokemonCard(
            "Charmander", "Fuego", "assets/images/charmander.png"),
        _buildPokemonCard("Squirtle", "Agua", "assets/images/squirtle.png"),
      ],
    );
  }

  Widget _buildPokemonCard(String name, String type, String imagePath) {
    return Card(
      child: Column(
        children: [
          Image.asset(
            imagePath,
            height: 120.0,
            width: 120.0,
          ),
          ListTile(
            title: Text(name),
            subtitle: _buildPokemonTag(type),
          ),
        ],
      ),
    );
  }

  Widget _buildPokemonTag(String type) {
    Color tagColor;
    switch (type.toLowerCase()) {
      case 'planta':
        tagColor = Colors.green;
        break;
      case 'fuego':
        tagColor = Colors.orange;
        break;
      case 'agua':
        tagColor = Colors.blue;
        break;
      default:
        tagColor = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: tagColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        type,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
