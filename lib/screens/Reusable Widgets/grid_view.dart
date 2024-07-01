import 'package:flutter/material.dart';

class GridViewWidgets extends StatelessWidget {
  const GridViewWidgets({super.key, required this.size});

  final Size size;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: 100,
      height: 100,
      child: Image.asset(
        "assets/1.jpg",
        fit: BoxFit.contain,
      ),
    );
  }
}
