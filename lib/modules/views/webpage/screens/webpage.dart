import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mirror_wall_inappwebview/modules/providers/all_mirror_provider.dart';
import 'package:mirror_wall_inappwebview/modules/views/homepage/model/web_model.dart';
import 'package:provider/provider.dart';

class Webpage extends StatelessWidget {
  const Webpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var webModelData = ModalRoute.of(context)!.settings.arguments as WebModel;
    var webServProvider = Provider.of<WebServProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(webModelData.name),
      ),
      bottomNavigationBar: Container(
        height: 65,
        width: double.infinity,
        color: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () async {
                  var controller = webServProvider.inAppWebViewController!;
                  if (await controller.canGoBack()) {
                    await controller.goBack();
                  }
                },
                icon: const Icon(Icons.arrow_back),
                color: Colors.white,
              ),
              IconButton(
                onPressed: () async {
                  var controller = webServProvider.inAppWebViewController!;
                  if (await controller.canGoForward()) {
                    await controller.goForward();
                  }
                },
                icon: const Icon(Icons.arrow_forward),
                color: Colors.white,
              ),
              IconButton(
                onPressed: () async {
                  var controller = webServProvider.inAppWebViewController!;
                  await controller.reload();
                },
                icon: const Icon(Icons.refresh),
                color: Colors.white,
              ),
              IconButton(
                onPressed: () async {
                  webServProvider.updateSelectedService(webModelData.name);

                  var controller = webServProvider.inAppWebViewController!;
                  await controller.loadUrl(
                    urlRequest: URLRequest(
                      url: WebUri(webModelData.link),
                    ),
                  );
                },
                icon: const Icon(Icons.home),
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
      body: InAppWebView(
        pullToRefreshController: webServProvider.pullToRefreshController,
        initialUrlRequest: URLRequest(
          url: WebUri(webModelData.link),
        ),
        onWebViewCreated: (InAppWebViewController controller) {
          webServProvider.inAppWebViewController = controller;
        },
        onLoadStop: (controller, uri) async {
          await webServProvider.pullToRefreshController?.endRefreshing();
        },
      ),
    );
  }
}