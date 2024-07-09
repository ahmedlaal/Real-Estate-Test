import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridViewWidgets extends StatefulWidget {
  const GridViewWidgets(
      {super.key,
      required this.size,
      required this.color,
      required this.image,
      required this.propertyType});

  final Size size;
  final Color color;
  final String image;
  final String propertyType;

  @override
  _GridViewWidgetsState createState() => _GridViewWidgetsState();
}

class _GridViewWidgetsState extends State<GridViewWidgets>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleExpand,
      child: Container(
        margin: EdgeInsets.all(4),
        width: 100,
        height: 100,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(widget.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: widget.size.height * 0.01,
              right: widget.size.width * 0.03,
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Container(
                    width: _animation.value *
                        widget.size.width *
                        0.4, // Start with 20, expand to 100
                    height: widget.size.height * 0.048,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                        child: Padding(
                            padding: EdgeInsets.only(
                                right: widget.size.width * 0.102),
                            child: Text(widget.propertyType))),
                  );
                },
              ),
            ),
            Positioned(
              bottom: widget.size.height * 0.01,
              right: widget.size.width * 0.01,
              child: Container(
                width: widget.size.width * 0.14,
                height: widget.size.height * 0.05,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 5, offset: Offset(3, 1), spreadRadius: 2)
                  ],
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: widget.size.width * 0.03,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
