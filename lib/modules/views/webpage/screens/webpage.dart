import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mirror_wall_inappwebview/modules/providers/all_mirror_provider.dart';
import 'package:mirror_wall_inappwebview/modules/views/homepage/model/web_model.dart';
import 'package:provider/provider.dart';

class Webpage extends StatelessWidget {
  final String url;

  const Webpage({Key? key, required this.url}) : super(key: key);

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
                icon: const Icon(Icons.star_outline),
                color: Colors.white,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text(
                          'Add Bookmark',
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                              onSubmitted: (val) {
                                webServProvider.textControllerModel.titleTxt;
                              },
                              controller:
                                  webServProvider.textControllerModel.titleTxt,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                hintText: 'Enter your Title',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Provider.of<WebServProvider>(context,
                                        listen: false)
                                    .addBookmark(url);
                                Navigator.of(context).pop();
                              },
                              child: Card(
                                elevation: 8,
                                margin: const EdgeInsets.only(top: 15),
                                child: Container(
                                  margin: const EdgeInsets.all(10),
                                  child: const Text("Save"),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
              IconButton(
                onPressed: () async {
                  var controller = webServProvider.inAppWebViewController!;
                  if (webServProvider.isLoading) {
                    webServProvider.stopLoading();
                    await controller.stopLoading();
                  } else {
                    webServProvider.startLoading();
                    await controller.reload();
                  }
                },
                icon: webServProvider.isLoading
                    ? const Icon(Icons.close)
                    : const Icon(Icons.refresh),
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
          webServProvider.stopLoading();
          await webServProvider.pullToRefreshController?.endRefreshing();
        },
      ),
    );
  }
}
