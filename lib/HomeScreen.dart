import 'dart:math';

import 'package:flutter/material.dart';

import 'News.dart';
import 'ViewModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController pageController;
  List<News> news = [];
  double firstScale = 1;
  double secondScale = 1;

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
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.grey.shade50),
      child: CustomScrollView(
        cacheExtent: 1,
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
                          opacity: ((184 - box.biggest.height) / 104.0).clamp(
                            0,
                            1,
                          ),
                          child: Text("第 56 屆全國技能競賽"),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          height: 10,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade50,
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
                    Icon(Icons.star, color: Colors.blue),
                    Text("今日焦點", style: TextStyle(fontWeight: FontWeight.bold)),
                    Spacer(),
                    Text("查看全部", style: TextStyle(color: Colors.grey)),
                    Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: 10000,
                  height: 230,
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
                          scale = (1 - (page - i).abs() * 0.3).clamp(0.8, 1.0);
                        }
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Transform.scale(
                            scale: scale,
                            child: ClipRRect(
                              borderRadius: BorderRadiusGeometry.circular(15),
                              child: Stack(
                                children: [
                                  SizedBox(
                                    width: 1000,
                                    height: 230,
                                    child: Image.asset(
                                      news[i].image,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            news[i].title,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            news[i].summary,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.calendar_month,
                                                color: Colors.grey,
                                                size: 16,
                                              ),
                                              Text(
                                                news[i].date,
                                                style: TextStyle(
                                                  color: Colors.grey,
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
                      },
                    ),
                    itemCount: news.length,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10.0,
                  right: 10.0,
                  bottom: 10,
                ),
                child: Row(
                  children: [
                    Icon(Icons.electric_bolt, color: Colors.blue),
                    Text("快速功能", style: TextStyle(fontWeight: FontWeight.bold)),
                    Spacer(),
                    Text("查看全部", style: TextStyle(color: Colors.grey)),
                    Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTapDown: (_) {
                        firstScale = 0.9;
                        setState(() {});
                      },
                      onTapUp: (_) {
                        firstScale = 1.0;
                        setState(() {});
                      },
                      child: TweenAnimationBuilder(
                        tween: Tween(begin: 0.0, end: firstScale),
                        duration: Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                        builder: (c, v, _) => Transform.scale(
                          scale: v,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 8.0,
                              right: 4.0,
                              top: 8.0,
                            ),
                            child: SizedBox(
                              height: 60,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.blue[200]!,
                                      Colors.blue,
                                      Color(0xff1b73b8),
                                    ],
                                    transform: GradientRotation(
                                      90 * (pi / 180),
                                    ),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        right: 8.0,
                                      ),
                                      child: Icon(
                                        Icons.emoji_events,
                                        color: Colors.yellow,
                                        size: 40,
                                      ),
                                    ),
                                    Text(
                                      "成績競賽\n排行榜",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20.0,
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.5),
                                          borderRadius: BorderRadius.circular(
                                            100,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 4.0,
                        right: 8.0,
                        top: 8.0,
                      ),
                      child: SizedBox(
                        height: 60,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(
                              colors: [
                                Colors.purple[200]!,
                                Colors.purple[300]!,
                                Colors.purple[600]!,
                              ],
                              transform: GradientRotation(90 * (pi / 180)),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Icon(
                                  Icons.history,
                                  color: Colors.yellow,
                                  size: 40,
                                ),
                              ),
                              Text(
                                "歷史賽事\n回顧",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10.0,
                  right: 10.0,
                  top: 10,
                ),
                child: Row(
                  children: [
                    Icon(Icons.list_alt, color: Colors.blue),
                    Text("最新消息", style: TextStyle(fontWeight: FontWeight.bold)),
                    Spacer(),
                    Text("查看全部", style: TextStyle(color: Colors.grey)),
                    Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                  ],
                ),
              ),
            ],
          ),
          SliverList.builder(
            itemBuilder: (context, i) => TweenAnimationBuilder(
              tween: Tween(begin: 0.0, end: 1.0),
              duration: Duration(milliseconds: 700),
              curve: Curves.easeInOut,
              builder: (BuildContext context, double value, Widget? child) =>
                  FractionalTranslation(
                    translation: Offset(1 - value, 0),
                    child: SizedBox(
                      width: 500,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8),
                        child: Card(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 70,
                                  width: 70 * (768 / 512),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.asset(
                                      news[i].image,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          news[i].title,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          news[i].summary,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.calendar_month,
                                              color: Colors.grey,
                                              size: 16,
                                            ),
                                            Text(
                                              news[i].date,
                                              style: TextStyle(
                                                color: Colors.grey,
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
                      ),
                    ),
                  ),
            ),
            itemCount: news.length,
          ),
        ],
      ),
    );
  }
}
