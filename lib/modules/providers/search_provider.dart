import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();
  List<String> searchType = ['google', 'bing', 'yahoo', 'duckduckgo'];
  String searchUrl = "";

  void searching(String search, String src) {
    if (src == 'google') {
      searchUrl = "https://www.google.com/search?q=";
    } else if (src == 'bing') {
      searchUrl = "https://www.bing.com/search?q=";
    } else if (src == 'duckduckgo') {
      searchUrl = "https://duckduckgo.com/search?q=";
    } else if (src == 'yahoo') {
      searchUrl = "https://in.search.yahoo.com/search?q=";
    }
    searchUrl = searchUrl + searchController.text;
    notifyListeners();
    searchController.clear();
  }
}
