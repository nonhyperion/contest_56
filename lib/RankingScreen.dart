import 'package:contest_56/ViewModel.dart';
import 'package:flutter/material.dart';

class RankingScreen extends StatefulWidget {
  final Map<String, dynamic> ranking;

  const RankingScreen({super.key, required this.ranking});

  @override
  State<RankingScreen> createState() => _RankingScreenState();
}

class _RankingScreenState extends State<RankingScreen> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> ranking = widget.ranking;
    return Hero(
      tag: "rank",
      child: Scaffold(
        backgroundColor: Color(0xff051632),
        appBar: AppBar(
          backgroundColor: Color(0xff051632),
          centerTitle: true,
          title: Text(
            "競賽成績排行",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          leadingWidth: 65,
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
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
        ),
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            Image.asset("assets/images/bg.png"),
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: SizedBox(
                height: 150,
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
              padding: const EdgeInsets.only(top: 150.0),
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        width: 400,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xff051632),
                            border: BoxBorder.all(
                              color: Color(0xff102143),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.looks_one_outlined,
                                  color: Colors.yellow,
                                  size: 100,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        ranking["rankings"][0]["unitName"]
                                            .toString(),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                        ),
                                      ),
                                      Divider(color: Colors.grey),
                                      IntrinsicHeight(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                  ranking["rankings"][0]["gold"]
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 25,
                                                    color: Colors.yellow,
                                                  ),
                                                ),
                                                Text(
                                                  "金牌",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            VerticalDivider(),
                                            Column(
                                              children: [
                                                Text(
                                                  ranking["rankings"][0]["silver"]
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 25,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                Text(
                                                  "銀牌",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            VerticalDivider(),
                                            Column(
                                              children: [
                                                Text(
                                                  ranking["rankings"][0]["bronze"]
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 25,
                                                    color: Colors.brown,
                                                  ),
                                                ),
                                                Text(
                                                  "銀牌",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            VerticalDivider(),
                                            Column(
                                              children: [
                                                Text(
                                                  ranking["rankings"][0]["total"]
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 25,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text(
                                                  "總獎牌數",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: SizedBox(
                          width: 400,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xff051632),
                              border: BoxBorder.all(
                                color: Color(0xff102143),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IntrinsicHeight(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          ranking["medalTotals"]["gold"]
                                              .toString(),
                                          style: TextStyle(
                                            fontSize: 25,
                                            color: Colors.yellow,
                                          ),
                                        ),
                                        Text(
                                          "金牌",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                    VerticalDivider(),
                                    Column(
                                      children: [
                                        Text(
                                          ranking["medalTotals"]["silver"]
                                              .toString(),
                                          style: TextStyle(
                                            fontSize: 25,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        Text(
                                          "銀牌",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                    VerticalDivider(),
                                    Column(
                                      children: [
                                        Text(
                                          ranking["medalTotals"]["bronze"]
                                              .toString(),
                                          style: TextStyle(
                                            fontSize: 25,
                                            color: Colors.brown,
                                          ),
                                        ),
                                        Text(
                                          "銀牌",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
