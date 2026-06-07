import 'dart:math';

import 'package:flutter/material.dart';

class FastActionButton extends StatefulWidget {
  final IconData icon;
  final String text;
  final List<Color> colors;
  final void Function() onClick;

  const FastActionButton({
    super.key,
    required this.icon,
    required this.text,
    required this.colors,
    required this.onClick,
  });

  @override
  State<FastActionButton> createState() => _FastActionButtonState();
}

class _FastActionButtonState extends State<FastActionButton> {
  double scale = 1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        scale = 0.95;
        setState(() {});
        await Future.delayed(Duration(milliseconds: 120));
        scale = 1;
        setState(() {});
        widget.onClick();
      },
      onTapDown: (_) {
        scale = 0.95;
        setState(() {});
      },
      child: TweenAnimationBuilder(
        tween: Tween(begin: 1.0, end: scale),
        duration: Duration(milliseconds: 120),
        curve: Curves.easeIn,
        builder: (c, v, _) => Transform.scale(
          scale: v,
          child: SizedBox(
            height: 60,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  colors: widget.colors,
                  transform: GradientRotation(90 * (pi / 180)),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(widget.icon, color: Colors.yellow, size: 40),
                  ),
                  Text(
                    widget.text,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
                        child: Icon(Icons.arrow_forward_ios, size: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
