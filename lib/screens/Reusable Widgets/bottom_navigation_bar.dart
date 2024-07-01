import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 25,
            offset: const Offset(0, 10),
          ),
        ],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.search,
                color: currentIndex == 0 ? Colors.redAccent : Colors.black),
            onPressed: () => onTap(0),
          ),
          IconButton(
            icon: Icon(Icons.message,
                color: currentIndex == 1 ? Colors.redAccent : Colors.black),
            onPressed: () => onTap(1),
          ),
          IconButton(
            icon: Icon(Icons.home,
                color: currentIndex == 2 ? Colors.redAccent : Colors.black),
            onPressed: () => onTap(2),
          ),
          IconButton(
            icon: Icon(Icons.favorite,
                color: currentIndex == 3 ? Colors.redAccent : Colors.black),
            onPressed: () => onTap(3),
          ),
          IconButton(
            icon: Icon(Icons.person_outline,
                color: currentIndex == 4 ? Colors.redAccent : Colors.black),
            onPressed: () => onTap(4),
          ),
        ],
      ),
    );
  }
}
