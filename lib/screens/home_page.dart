import 'package:countup/countup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:realstateapp/screens/Reusable%20Widgets/appbar.dart';
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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 235, 187, 115),
      appBar: AnimatedAppBar(),
      body: SafeArea(
        child: Container(
          height: size.height * 0.8,
          width: size.width * 1,
          padding: EdgeInsets.only(
              left: size.width * 0.02,
              right: size.width * 0.02,
              top: size.height * 0.01),
          child: Stack(
            // crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Positioned(top: 0, left: 0, right: 0, child: TextAnimation()),
              // SizedBox(height: size.height * 0.02),
              Positioned(
                  top: size.height * 0.1,
                  left: size.width * 0.02,
                  right: size.width * 0.02,
                  child: Counters(size: size)),
              // SizedBox(height: size.height * 0.02),
              // Expanded(
              //   child: MasonryGridView.count(
              //     crossAxisCount: 2,
              //     mainAxisSpacing: 2,
              //     crossAxisSpacing: 2,
              //     itemCount: 4,
              //     itemBuilder: (context, index) {
              //       return Container(
              //         width: size.width * 1,
              //         child: Image.asset(
              //           "assets/${index + 1}.jpg",
              //           fit: BoxFit.contain,
              //         ),
              //       );
              //     },
              //   ),
              // ),
              // Expanded(
              //   child: ListView(
              //     scrollDirection: Axis.vertical,
              //     physics: ScrollPhysics(),
              //     children: [
              //       StaggeredGridTile.count(
              //         crossAxisCellCount: 2, // Adjusted to fit within the grid
              //         mainAxisCellCount: 2,
              //         child: Container(
              //           width: size.width * 1,
              //           child: Image.asset(
              //             "assets/1.jpg",
              //             fit: BoxFit.contain,
              //           ),
              //         ),
              //       ),
              //       StaggeredGridTile.count(
              //         crossAxisCellCount: 2,
              //         mainAxisCellCount: 2,
              //         child: Container(
              //           width: size.width * 1,
              //           child: Image.asset(
              //             "assets/2.jpg",
              //             fit: BoxFit.contain,
              //           ),
              //         ),
              //       ),
              //       StaggeredGridTile.count(
              //         crossAxisCellCount: 2,
              //         mainAxisCellCount: 2,
              //         child: Container(
              //           width: size.width * 1,
              //           child: Image.asset(
              //             "assets/3.jpg",
              //             fit: BoxFit.contain,
              //           ),
              //         ),
              //       ),
              //       StaggeredGridTile.count(
              //         crossAxisCellCount: 2,
              //         mainAxisCellCount: 1,
              //         child: Container(
              //           width: size.width * 1,
              //           child: Image.asset(
              //             "assets/4.jpg",
              //             fit: BoxFit.contain,
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),

              // ListView(children: [
              //   StaggeredGrid.count(
              //     crossAxisCount: 4,
              //     mainAxisSpacing: 4,
              //     crossAxisSpacing: 4,
              //     children: [
              //       StaggeredGridTile.count(
              //         crossAxisCellCount: 2,
              //         mainAxisCellCount: 2,
              //         child: GridViewWidgets(size: size),
              //       ),
              //       StaggeredGridTile.count(
              //         crossAxisCellCount: 2,
              //         mainAxisCellCount: 1,
              //         child: GridViewWidgets(size: size),
              //       ),
              //       StaggeredGridTile.count(
              //         crossAxisCellCount: 1,
              //         mainAxisCellCount: 1,
              //         child: GridViewWidgets(size: size),
              //       ),
              //       StaggeredGridTile.count(
              //         crossAxisCellCount: 1,
              //         mainAxisCellCount: 1,
              //         child: GridViewWidgets(size: size),
              //       ),
              //       StaggeredGridTile.count(
              //         crossAxisCellCount: 4,
              //         mainAxisCellCount: 2,
              //         child: GridViewWidgets(size: size),
              //       ),
              //     ],
              //   ),
              // ]),
            ],
          ),
        ),
      ),
    );
  }
}

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
            height: size.height * 0.2,
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
            height: size.height * 0.14,
            width: size.width * 0.35,
            decoration: BoxDecoration(
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
