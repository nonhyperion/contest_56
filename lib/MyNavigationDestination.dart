import 'package:flutter/material.dart';

class MyNavigationDestination extends StatefulWidget {
  final Icon icon;
  final String label;

  const MyNavigationDestination({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  State<MyNavigationDestination> createState() =>
      _MyNavigationDestinationState();
}

class _MyNavigationDestinationState extends State<MyNavigationDestination> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [widget.icon, Text(widget.label)]);
  }
}
