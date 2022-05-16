import 'package:e_mading/screens/news/news.dart';
import 'package:e_mading/screens/news/profil.dart';
import 'package:flutter/material.dart';

class News1 extends StatefulWidget {
  const News1({Key? key}) : super(key: key);

  @override
  State<News1> createState() => _News1State();
}

class _News1State extends State<News1> {
  int _currentIndex = 0;
  List<Widget> pages = const [
    News(),
    Profil(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('e-mading news'),
      ),
      body: Center(child: pages[_currentIndex]),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.white.withOpacity(0.5),
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        child: NavigationBar(
          backgroundColor: Colors.yellow,
          animationDuration: const Duration(seconds: 1),
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          height: 60,
          selectedIndex: _currentIndex,
          onDestinationSelected: (int newIndex) {
            setState(() {
              _currentIndex = newIndex;
            });
          },
          destinations: const [
            NavigationDestination(
                selectedIcon: Icon(Icons.home),
                icon: Icon(Icons.home_outlined),
                label: 'home'),
            NavigationDestination(
                selectedIcon: Icon(Icons.person),
                icon: Icon(Icons.person_outline),
                label: 'eco')
          ],
        ),
      ),
    );
  }
}
