import 'package:flutter/material.dart';
import 'package:projectflutter/Pages/homepage.dart';
import 'package:projectflutter/Pages/katalog.dart';
import 'package:projectflutter/Pages/profil.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';



void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

 class _MainAppState extends State<MainApp> {
  int selectedIndex = 0;
  final PageController pageController = PageController();

  final List<Widget> pages = [];

  @override
  void initState() {
    super.initState();
    pages.addAll([
      const HomePage(),
      const Katalog(),
      const Profil(),
    ]);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Semarangku',
      theme: ThemeData(
        primaryColor: const Color(0xFF2185D0),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Image.asset(
                'images/logo.png',
                height: 30,
              ),
              const SizedBox(width: 10),
              const Text(
                'Semarangku',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        body: pages[selectedIndex],
        bottomNavigationBar: StylishBottomBar(
          option: DotBarOptions(
            dotStyle: DotStyle.tile,
            gradient: const LinearGradient(
              colors: [Colors.deepPurple, Colors.pink],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          items: [
            BottomBarItem(
              icon: const Icon(Icons.home),
              title: const Text('Home'),
              backgroundColor: const Color.fromARGB(255, 91, 199, 28),
              selectedIcon: const Icon(Icons.home_outlined),
            ),
            BottomBarItem(
              icon: const Icon(Icons.travel_explore),
              title: const Text('Explore'),
              backgroundColor: Colors.orange,
            ),
            BottomBarItem(
              icon: const Icon(Icons.favorite),
              title: const Text('Favorites'),
              backgroundColor: const Color.fromARGB(255, 255, 0, 0),
            ),
            BottomBarItem(
              icon: const Icon(Icons.person),
              title: const Text('Profile'),
              backgroundColor: Colors.blue,
            ),
          ],
          fabLocation: StylishBarFabLocation.center,
          hasNotch: true,
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}