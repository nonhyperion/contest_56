import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(HomeScreen());
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: DecoratedBox(
          decoration: BoxDecoration(color: Colors.white),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                flexibleSpace: LayoutBuilder(
                  builder: (context, box) {
                    return FlexibleSpaceBar(
                      titlePadding: EdgeInsetsGeometry.zero,
                      title: Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Opacity(
                              opacity: ((184 - box.biggest.height) / 104.0)
                                  .clamp(0, 1),
                              child: Text("第 56 屆全國技能競賽"),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: SizedBox(
                              height: 10,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(100),
                                    topLeft: Radius.circular(100),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      centerTitle: true,
                      background: Image.asset(
                        "assets/bg.png",
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                ),
                pinned: true,
                expandedHeight: 161.5,
              ),
              SliverList.list(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      children: [
                        Icon(Icons.star_border, color: Colors.blue),
                        Text(
                          "今日焦點",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    height: 300 / 16 * 9,
                    child: ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(100),
                      child: Image.asset("assets/bg.png"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
