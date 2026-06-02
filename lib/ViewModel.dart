import 'dart:convert';

import 'package:flutter/services.dart';

import 'News.dart';
import 'dart:convert';

import 'package:flutter/services.dart';

import 'News.dart';

class ViewModel {
  ViewModel._();

  static final ViewModel _viewModel = ViewModel._();

  factory ViewModel() => _viewModel;

  Future<List<News>> getNews() async {
    List<dynamic> json = jsonDecode(
      await rootBundle.loadString("assets/news_data.json"),
    );
    return json.map((i) => News.FromJson(i)).toList();
  }
}
