import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:realstateapp/screens/Reusable%20Widgets/appbar.dart';
import 'package:realstateapp/screens/Reusable%20Widgets/counters.dart';
import 'package:realstateapp/screens/Reusable%20Widgets/grid_view.dart';
import 'package:realstateapp/screens/Reusable%20Widgets/text_animation.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: false);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  double _scrollOffset = 0.0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AnimatedAppBar(),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: const [
                Colors.white,
                Colors.white,
                Color.fromARGB(255, 253, 239, 216),
                Color.fromARGB(255, 250, 226, 189)
              ])),
          height: size.height * 1,
          width: size.width * 1,
          padding: EdgeInsets.only(
              left: size.width * 0.02,
              right: size.width * 0.02,
              top: size.height * 0.01),
          child: Stack(
            children: [
              Positioned(
                top: size.height * 0.03,
                left: 0,
                right: 0,
                child: Opacity(
                  opacity: _scrollOffset > size.height * 0.3 ? 0 : 1,
                  child: TextAnimation(),
                ),
              ),
              Positioned(
                top: size.height * 0.2,
                left: size.width * 0.02,
                right: size.width * 0.02,
                child: Opacity(
                  opacity: _scrollOffset > size.height * 0.3 ? 0 : 1,
                  child: Counters(size: size),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification scrollInfo) {
                    setState(() {
                      _scrollOffset = scrollInfo.metrics.pixels;
                    });
                    return true;
                  },
                  child: ListView(
                    children: [
                      SizedBox(height: size.height * 0.4), // Reduced height
                      StaggeredGrid.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 0,
                        crossAxisSpacing: 0,
                        children: [
                          StaggeredGridTile.count(
                            crossAxisCellCount: 2,
                            mainAxisCellCount: 1,
                            child: GridViewWidgets(
                              size: size,
                              color: Colors.black,
                              image: "assets/3.jpg",
                            ),
                          ),
                          StaggeredGridTile.count(
                            crossAxisCellCount: 1,
                            mainAxisCellCount: 1,
                            child: GridViewWidgets(
                              size: size,
                              color: Colors.black12,
                              image: "assets/1.jpg",
                            ),
                          ),
                          StaggeredGridTile.count(
                            crossAxisCellCount: 1,
                            mainAxisCellCount: 1,
                            child: GridViewWidgets(
                              size: size,
                              color: const Color.fromARGB(255, 214, 36, 36),
                              image: "assets/3.jpg",
                            ),
                          ),
                          StaggeredGridTile.count(
                            crossAxisCellCount: 1,
                            mainAxisCellCount: 1,
                            child: GridViewWidgets(
                              size: size,
                              color: Colors.green,
                              image: "assets/4.jpg",
                            ),
                          ),
                          StaggeredGridTile.count(
                            crossAxisCellCount: 1,
                            mainAxisCellCount: 1,
                            child: GridViewWidgets(
                              size: size,
                              color: Colors.blue,
                              image: "assets/3.jpg",
                            ),
                          ),
                          StaggeredGridTile.count(
                            crossAxisCellCount: 1,
                            mainAxisCellCount: 1,
                            child: GridViewWidgets(
                              size: size,
                              color: Colors.blueGrey,
                              image: "assets/1.jpg",
                            ),
                          ),
                          StaggeredGridTile.count(
                            crossAxisCellCount: 1,
                            mainAxisCellCount: 1,
                            child: GridViewWidgets(
                              size: size,
                              color: Colors.orange,
                              image: "assets/2.jpg",
                            ),
                          ),
                          StaggeredGridTile.count(
                            crossAxisCellCount: 1,
                            mainAxisCellCount: 1,
                            child: GridViewWidgets(
                              size: size,
                              color: Colors.orangeAccent,
                              image: "assets/2.jpg",
                            ),
                          ),
                          StaggeredGridTile.count(
                            crossAxisCellCount: 1,
                            mainAxisCellCount: 1,
                            child: GridViewWidgets(
                              size: size,
                              color: Colors.deepOrangeAccent,
                              image: "assets/3.jpg",
                            ),
                          ),
                          StaggeredGridTile.count(
                            crossAxisCellCount: 1,
                            mainAxisCellCount: 1,
                            child: GridViewWidgets(
                              size: size,
                              color: Colors.purple,
                              image: "assets/1.jpg",
                            ),
                          ),
                          StaggeredGridTile.count(
                            crossAxisCellCount: 1,
                            mainAxisCellCount: 1,
                            child: GridViewWidgets(
                              size: size,
                              color: Colors.pink,
                              image: "assets/3.jpg",
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
