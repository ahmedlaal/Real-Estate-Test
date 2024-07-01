import 'package:flutter/material.dart';
import 'package:realstateapp/screens/Reusable%20Widgets/screen_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int currentIndex = 2;
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Screens should be below the bottom navigation bar
          Positioned.fill(
            child: Screens[currentIndex],
          ),
          // Animated bottom navigation bar
          Align(
            alignment: Alignment.bottomCenter,
            child: SlideTransition(
              position: _slideAnimation,
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 25,
                      offset: const Offset(8, 20),
                    ),
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
                    items: const [
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
          ),
        ],
      ),
    );
  }
}
