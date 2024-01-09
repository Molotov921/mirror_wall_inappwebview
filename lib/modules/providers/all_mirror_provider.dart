import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mirror_wall_inappwebview/modules/models/bookmark_model.dart';
import 'package:mirror_wall_inappwebview/modules/models/text_controller_model.dart';

class WebServProvider extends ChangeNotifier {
  String selectedService = "";
  bool isLoading = false;

  InAppWebViewController? inAppWebViewController;
  PullToRefreshController? pullToRefreshController;

  WebServProvider() {
    pullToRefreshController = PullToRefreshController(
      settings: PullToRefreshSettings(color: Colors.blue),
      onRefresh: () {
        startLoading();
        inAppWebViewController?.reload();
      },
    );
  }

  List<Bookmark> bookmarks = [];

  TextControllerModel textControllerModel = TextControllerModel(
    titleTxt: TextEditingController(text: ''),
  );

  void updateSelectedService(String service) {
    selectedService = service;
    notifyListeners();
  }

  String getSelectedService() {
    return selectedService;
  }

  void startLoading() {
    isLoading = true;
    notifyListeners();
  }

  void stopLoading() {
    isLoading = false;
    notifyListeners();
  }

  void addBookmark(String url) {
    bookmarks.add(Bookmark(title: textControllerModel.titleTxt.text, url: url));
    notifyListeners();
    textControllerModel.titleTxt.clear();
  }

  void deleteBookmark(int index) {
    bookmarks.removeAt(index);
    notifyListeners();
  }

  void editBookmark(int index, String newTitle) {
    bookmarks[index].title = newTitle;
    notifyListeners();
    textControllerModel.titleTxt.clear();
  }
}
