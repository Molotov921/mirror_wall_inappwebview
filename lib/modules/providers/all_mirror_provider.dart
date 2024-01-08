import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

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
}
