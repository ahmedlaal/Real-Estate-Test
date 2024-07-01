import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:realstateapp/screens/Functions/functions.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          height: size.height * 0.9,
          width: size.width * 1,
          padding: EdgeInsets.only(
              left: size.width * 0.02,
              right: size.width * 0.02,
              top: size.height * 0.03),
          child: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          focusColor: Colors.white,
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: Color.fromARGB(0, 255, 255, 255)),
                          ),
                          hintText: "Saint Diago",
                          prefixIcon: Icon(Icons.search),
                          contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.03,
                    ),
                    Container(
                      // color: Colors.white,
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Center(
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.format_align_center)),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Stack(
        children: [
          Positioned(
            left: size.width * 0.1,
            bottom: size.height * 0.2,
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: () {
                // Add your onPressed code here!
              },
              child: Icon(Icons.layers),
            ),
          ),
          Positioned(
            left: size.width * 0.1,
            bottom: size.height * 0.12,
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: () {
                final RenderBox button =
                    context.findRenderObject() as RenderBox;
                final RenderBox overlay =
                    Overlay.of(context).context.findRenderObject() as RenderBox;
                final Offset offset =
                    button.localToGlobal(Offset.zero, ancestor: overlay);
                final Offset buttonPosition =
                    Offset(button.size.width * 0.1, button.size.height * 0.55);
                showPopupMenu(context, buttonPosition);
              },
              child: Icon(CupertinoIcons.paperplane),
            ),
          ),
          Positioned(
            right: size.width * 0.1,
            bottom: size.height * 0.12,
            child: FloatingActionButton.extended(
              backgroundColor: Colors.white,
              label: Text("List of variants"),
              onPressed: () {
                // Add your onPressed code here!
              },
              icon: Icon(Icons.list),
            ),
          ),
        ],
      ),
    );
  }
}
