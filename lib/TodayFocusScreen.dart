import 'package:contest_56/ViewModel.dart';
import 'package:flutter/material.dart';

import 'News.dart';

class TodayFocusScreen extends StatefulWidget {
  final News news;
  final String tag;

  const TodayFocusScreen({super.key, required this.news, required this.tag});

  @override
  State<TodayFocusScreen> createState() => _TodayFocusScreenState();
}

class _TodayFocusScreenState extends State<TodayFocusScreen> {
  List<News> news = [];

  @override
  void initState() {
    init();
    super.initState();
  }

  Future<void> init() async {
    news = await ViewModel().getNews();
    news.removeWhere((i) => i.id == widget.news.id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff051632),
      body: Stack(
        children: [
          CustomScrollView(
            cacheExtent: 1,
            slivers: [
              SliverToBoxAdapter(
                child: Hero(
                  tag: widget.tag,
                  child: Material(
                    color: Colors.transparent,
                    child: SingleChildScrollView(
                      child: Stack(
                        children: [
                          SizedBox(
                            height: 300,
                            child: Image.asset(
                              widget.news.image,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(0, 100),
                            child: SizedBox(
                              height: 200,
                              width: 10000,
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    stops: [0.2, 0.8, 1],
                                    colors: [
                                      Colors.transparent,
                                      Color(0xff051632),
                                      Color(0xff051632),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 200),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xff1939AD),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 6,
                                        vertical: 2,
                                      ),
                                      child: Text(
                                        widget.news.category,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    widget.news.title,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.calendar_month,
                                        color: Colors.grey,
                                        size: 16,
                                      ),
                                      Text(
                                        widget.news.date,
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      SizedBox(
                                        height: 12,
                                        child: VerticalDivider(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Icon(
                                        Icons.folder_open_outlined,
                                        color: Colors.grey,
                                        size: 16,
                                      ),
                                      Text(
                                        "技能競賽",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      widget.news.content,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Wrap(
                                      spacing: 8,
                                      runSpacing: 8,
                                      children: [
                                        for (var i in widget.news.tags)
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Color(0xff0F2A77),
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 5,
                                                  ),
                                              child: Text(
                                                "#$i",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Divider(color: Colors.grey),
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
              SliverList.builder(
                itemBuilder: (c, i) {
                  var tag = DateTime.now().microsecondsSinceEpoch.toString();
                  return TweenAnimationBuilder(
                    tween: Tween(begin: 0.0, end: 1.0),
                    duration: Duration(milliseconds: 700),
                    curve: Curves.easeInOut,
                    builder:
                        (
                          BuildContext context,
                          double value,
                          Widget? child,
                        ) => Hero(
                          tag: tag,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (c) =>
                                      TodayFocusScreen(news: news[i], tag: tag),
                                ),
                              );
                            },
                            child: Material(
                              color: Colors.transparent,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: FractionalTranslation(
                                  translation: Offset(1 - value, 0),
                                  child: SizedBox(
                                    width: 500,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 8.0,
                                        right: 8,
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xff0D1A34),
                                          border: BoxBorder.all(
                                            color: Color(0xff102143),
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                height: 69,
                                                width: 69 * (768 / 512),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  child: Image.asset(
                                                    news[i].image,
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                        left: 8.0,
                                                      ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        news[i].title,
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .calendar_month,
                                                            color: Colors.grey,
                                                            size: 16,
                                                          ),
                                                          Text(
                                                            news[i].date,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  right: 10.0,
                                                ),
                                                child: Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: Colors.white,
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
                          ),
                        ),
                  );
                },
                itemCount: news.length,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox.square(
              dimension: 40,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(1000),
                ),
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
