import 'package:countup/countup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:realstateapp/screens/Reusable%20Widgets/appbar.dart';

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
      // appBar: AppBar(
      //   title: FadeTransition(
      //     opacity: _animation,
      //     // duration: Duration(milliseconds: 400),
      //     child: Container(
      //       height: size.height * 0.2,
      //       width: size.width * 0.4,
      //       child: FlutterLogo(),
      //       // TextFormField(
      //       //   decoration: InputDecoration(
      //       //     border: OutlineInputBorder(),
      //       //     hintText: 'Search',
      //       //   ),
      //       // ),
      //     ),
      //   ),
      //   // backgroundColor: Colors.red,
      // ),

      body: SafeArea(
        child: Container(
          height: size.height * 0.8,
          width: size.width * 1,
          padding: EdgeInsets.only(
              top: size.height * 0.1,
              left: size.width * 0.1,
              right: size.width * 0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hi, Marina",
                style: TextStyle(fontSize: 12),
              ),
              Container(
                  width: size.width * 0.6,
                  child: Text("let's select your perfect place  ",
                      style: TextStyle(fontSize: 22))),
              Row(
                children: [
                  // SizedBox(
                  //   width: size.width * 0.1,
                  // ),
                  Container(
                    height: size.height * 0.3,
                    width: size.width * 0.4,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        // borderRadius: BorderRadius.all(
                        //     // Radius.circular(100),
                        //     ),
                        color: Colors.orange),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Buy",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                        // SizedBox(
                        //   height: size.height * 0.1,
                        // ),
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
                        // SizedBox(
                        //   height: size.height * 0.1,
                        // ),
                        Text(
                          "Offers",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.04,
                  ),
                  Container(
                    height: size.height * 0.17,
                    width: size.width * 0.35,
                    decoration: BoxDecoration(
                        // shape: BoxShape.circle,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Colors.white),
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
                          style: TextStyle(fontSize: 26, color: Colors.grey),
                        ),
                        Text(
                          "Offers",
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Expanded(
                child: ListView(
                    scrollDirection: Axis.vertical,
                    physics: ScrollPhysics(),
                    children: [
                      StaggeredGrid.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 2,
                        crossAxisSpacing: 2,
                        children: [
                          StaggeredGridTile.count(
                              crossAxisCellCount: 4,
                              mainAxisCellCount: 2,
                              child: Container(
                                width: size.width * 1,
                                child: Image.asset(
                                  "assets/1.jpg",
                                  fit: BoxFit.contain,
                                ),
                              )),
                          StaggeredGridTile.count(
                              crossAxisCellCount: 2,
                              mainAxisCellCount: 2,
                              child: Container(
                                width: size.width * 1,
                                child: Image.asset(
                                  "assets/2.jpg",
                                  fit: BoxFit.contain,
                                ),
                              )),
                          StaggeredGridTile.count(
                              crossAxisCellCount: 2,
                              mainAxisCellCount: 2,
                              child: Container(
                                width: size.width * 1,
                                child: Image.asset(
                                  "assets/3.jpg",
                                  fit: BoxFit.contain,
                                ),
                              )),
                          StaggeredGridTile.count(
                              crossAxisCellCount: 1,
                              mainAxisCellCount: 1,
                              child: Container(
                                width: size.width * 1,
                                child: Image.asset(
                                  "assets/4.jpg",
                                  fit: BoxFit.contain,
                                ),
                              )),
                        ],
                      ),
                    ]),
              ),

              // QuiltedGridTile(mainAxisCount, crossAxisCount)

              // StaggeredGrid.custom(delegate: delegate)

              // GridView.builder(gridDelegate: , itemBuilder: itemBuilder)
            ],
          ),
        ),
      ),
    );
  }
}
