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
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              flexibleSpace: LayoutBuilder(
                builder: (context, box) {
                  return FlexibleSpaceBar(
                    title: Opacity(
                      opacity: ((224 - box.biggest.height) / 144.0),
                      child: Text("第 56 屆全國技能競賽"),
                    ),
                    centerTitle: true,
                    background: Image.asset("assets/bg.png"),
                  );
                },
              ),
              pinned: true,
              expandedHeight: 190,
            ),
            SliverToBoxAdapter(child: Card(child: Text("data"))),
          ],
        ),
      ),
    );
  }
}
