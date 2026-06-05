import 'dart:ffi';
import 'dart:math';

import 'package:contest_56/MyNavigationDestination.dart';
import 'package:contest_56/ViewModel.dart';
import 'package:flutter/material.dart';

import 'HomeScreen.dart';
import 'News.dart';

void main() {
  runApp(MainScreen());
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: HomeScreen()));
  }
}
