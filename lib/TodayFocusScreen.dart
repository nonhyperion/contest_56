import 'package:flutter/material.dart';

class TodayFocusScreen extends StatefulWidget {
  final String imagePath;

  const TodayFocusScreen({super.key, required this.imagePath});

  @override
  State<TodayFocusScreen> createState() => _TodayFocusScreenState();
}

class _TodayFocusScreenState extends State<TodayFocusScreen> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.imagePath,
      child: Scaffold(
        backgroundColor: Color(0xff051632),
        body: Column(
          children: [
            //SizedBox(height: 300, child: Image.asset(widget.imagePath, fit: BoxFit.fitHeight)),
          ],
        ),
      ),
    );
  }
}
