import 'dart:ffi';

import 'package:contest_56/ViewModel.dart';
import 'package:flutter/material.dart';

import 'News.dart';

void main() {
  runApp(HomeScreen());
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController pageController;
  List<News> news = [];

  @override
  void initState() {
    pageController = PageController();
    init();
    super.initState();
  }

  Future<void> init() async {
    news = await ViewModel().getNews();
    setState(() {});
  }

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
                                    topRight: Radius.circular(10),
                                    topLeft: Radius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      centerTitle: true,
                      background: Image.asset(
                        "assets/images/bg.png",
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
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Row(
                      children: [
                        Icon(Icons.star_border, color: Colors.blue),
                        Text(
                          "今日焦點",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Text("查看全部", style: TextStyle(color: Colors.grey)),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: 1000,
                      height: 200,
                      child: PageView.builder(
                        onPageChanged: (i) {
                          setState(() {});
                        },
                        controller: pageController,
                        itemBuilder: (c, i) => AnimatedBuilder(
                          animation: pageController,
                          builder: (BuildContext context, Widget? child) {
                            double scale = 1.0;

                            if (pageController.position.hasContentDimensions) {
                              double page =
                                  pageController.page ??
                                  pageController.initialPage.toDouble();
                              scale = (1 - (page - i).abs() * 0.3).clamp(
                                0.8,
                                1.0,
                              );
                            }

                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Transform.scale(
                                scale: scale,
                                child: ClipRRect(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    15,
                                  ),
                                  child: Image.asset(
                                    news[i].image,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        itemCount: news.length,
                      ),
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
