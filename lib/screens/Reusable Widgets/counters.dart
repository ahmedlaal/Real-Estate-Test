import 'package:countup/countup.dart';
import 'package:flutter/material.dart';

class Counters extends StatelessWidget {
  const Counters({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Container(
            height: size.height * 0.18, // Reduced height
            width: size.width * 0.4,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.orange,
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Buy",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                Countup(
                  begin: 0,
                  end: 7500,
                  duration: Duration(seconds: 3),
                  separator: ',',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                  ),
                ),
                Text(
                  "Offers",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: size.width * 0.04),
        Flexible(
          child: Container(
            height: size.height * 0.18, // Reduced height
            width: size.width * 0.4,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  offset: const Offset(0, 10),
                  blurRadius: 20,
                  spreadRadius: 5,
                )
              ],
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              color: Colors.white,
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Rent",
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                Countup(
                  begin: 0,
                  end: 7500,
                  duration: Duration(seconds: 3),
                  separator: ',',
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  "Offers",
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
