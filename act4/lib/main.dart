import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi App con Tabs'),
      ),
      body: _buildBody(),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavyBarItem(
            icon: const Icon(Icons.home),
            title: const Text('Carrusel'),
            activeColor: Colors.blue,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.person),
            title: const Text('Perfil'),
            activeColor: Colors.blue,
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    if (_currentIndex == 0) {
      return const CarouselScreen();
    } else {
      return const ProfileScreen();
    }
  }
}

class CarouselScreen extends StatelessWidget {
  const CarouselScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CarouselSlider(
        options: CarouselOptions(
          height: 200.0,
          enableInfiniteScroll: false,
          enlargeCenterPage: true,
        ),
        items: [
          Container(
            color: Colors.blue,
            child: const Center(child: Text('Contenido 1')),
          ),
          Container(
            color: Colors.green,
            child: const Center(child: Text('Contenido 2')),
          ),
          Container(
            color: Colors.red,
            child: const Center(child: Text('Contenido 3')),
          ),
        ],
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 60.0,
            backgroundImage: AssetImage(
                'assets/images/profile_image.jpg'), // Coloca la ruta correcta de tu imagen
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              // Acción al hacer clic en "Editar Perfil"
            },
            child: const Text('Editar Perfil'),
          ),
        ],
      ),
    );
  }
}
