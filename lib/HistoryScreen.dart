import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "history",
      child: Scaffold(
        backgroundColor: Color(0xff051632),
        appBar: AppBar(
          backgroundColor: Color(0xff051632),
          centerTitle: true,
          title: Text(
            "歷屆賽事回顧",
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
                child: Column(
                  children: [
                    HistoryCard(
                      year: "2026",
                      th: "56",
                      location: "臺北",
                      isFirst: true,
                    ),
                    HistoryCard(year: "2026", th: "56", location: "臺北"),
                    HistoryCard(year: "2025", th: "55", location: "臺北"),
                    HistoryCard(year: "2024", th: "54", location: "臺北"),
                    HistoryCard(
                      year: "2023",
                      th: "53",
                      location: "臺北",
                      isLast: true,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HistoryCard extends StatefulWidget {
  final bool? isFirst;
  final bool? isLast;
  final String year;
  final String th;
  final String location;

  const HistoryCard({
    super.key,
    this.isFirst,
    this.isLast,
    required this.year,
    required this.th,
    required this.location,
  });

  @override
  State<HistoryCard> createState() => _HistoryCardState();
}

class _HistoryCardState extends State<HistoryCard> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (c, box) {
        return IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      children: [
                        Flexible(
                          flex: 1,
                          child: VerticalDivider(
                            color: widget.isFirst == true
                                ? Colors.transparent
                                : Colors.grey,
                            thickness: 1.8,
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: VerticalDivider(
                            color: widget.isLast == true
                                ? Colors.transparent
                                : Colors.grey,
                            thickness: 1.8,
                          ),
                        ),
                      ],
                    ),
                    SizedBox.square(
                      dimension: 35,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1000),
                          color: Color(0xff051632),
                        ),
                      ),
                    ),
                    SizedBox.square(
                      dimension: 20,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1000),
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox.square(
                      dimension: 17,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1000),
                          color: Color(0xff051632),
                        ),
                      ),
                    ),
                    SizedBox.square(
                      dimension: 13,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1000),
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0, top: 16.0),
                child: SizedBox(
                  width: 350,
                  height: 100,
                  child: SizedBox(
                    width: 500,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xff0D1A34),
                          border: BoxBorder.all(
                            color: Color(0xff102143),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text.rich(
                                    TextSpan(
                                      text: "第",
                                      children: [
                                        TextSpan(
                                          text: widget.th,
                                          style: TextStyle(fontSize: 25),
                                        ),
                                        TextSpan(text: "屆"),
                                      ],
                                    ),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xff1939AD),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 6,
                                      ),
                                      child: Text(
                                        widget.year,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        color: Colors.grey,
                                        size: 16,
                                      ),
                                      Text(
                                        widget.location,
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
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
              ),
            ],
          ),
        );
      },
    );
  }
}
