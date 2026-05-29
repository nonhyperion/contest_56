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
              flexibleSpace: FlexibleSpaceBar(
                title: Text("第 56 屆全國技能競賽"),
                background: Image.asset("assets/bg.png"),
              ),
              pinned: true,
              centerTitle: true,
              expandedHeight: 200,
            ),
            SliverList.builder(
              itemBuilder: (context, i) => ListTile(title: Text(i.toString())),
              itemCount: 100,
            ),
          ],
        ),
      ),
    );
  }
}
