import 'package:flutter/material.dart';
import 'package:realstateapp/screens/Reusable%20Widgets/screen_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          // Screens should be below the bottom navigation bar
          Positioned.fill(
            child: Screens[currentIndex],
          ),
          // Bottom navigation bar
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.transparent,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 25,
                    offset: const Offset(8, 20),
                  )
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: BottomNavigationBar(
                  backgroundColor:
                      Colors.red, // Change this to your preferred color
                  selectedItemColor: Colors.redAccent,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  unselectedItemColor: Colors.black,
                  currentIndex: currentIndex,
                  onTap: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.search),
                      label: "",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.message),
                      label: "",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: "",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.favorite),
                      label: "",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person_outline),
                      label: "",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
