import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mirror_wall_inappwebview/modules/providers/search_provider.dart';
import 'package:provider/provider.dart';

String searchedText = "";

class SearchWebPage extends StatefulWidget {
  const SearchWebPage({super.key});

  @override
  State<SearchWebPage> createState() => _SearchWebState();
}

late InAppWebViewController _searchViewController;

class _SearchWebState extends State<SearchWebPage> {
  String selectedSearchEngine = 'google';

  @override
  Widget build(BuildContext context) {
    Provider.of<SearchProvider>(context, listen: false)
        .searching(searchedText, selectedSearchEngine);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search View'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: Provider.of<SearchProvider>(context, listen: false)
                    .searchController,
                onChanged: (val) {
                  Provider.of<SearchProvider>(context, listen: false)
                      .searchController
                      .text = val;
                  searchedText = val;
                },
                decoration: InputDecoration(
                  labelText: 'Search on Google',
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        child: Image.asset(
                          'assets/images/$selectedSearchEngine.png',
                          height: 24.0,
                          width: 24.0,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () async {
                          Provider.of<SearchProvider>(context, listen: false)
                              .searching(searchedText, selectedSearchEngine);
                          await _searchViewController.loadUrl(
                            urlRequest: URLRequest(
                              url: WebUri.uri(
                                Uri.parse(
                                  Provider.of<SearchProvider>(context,
                                          listen: false)
                                      .searchUrl,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonFormField<String>(
                value: selectedSearchEngine,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                    ),
                  ),
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedSearchEngine = newValue!;
                  });
                },
                items: Provider.of<SearchProvider>(context)
                    .searchType
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/$value.png',
                          height: 24.0,
                          width: 24.0,
                        ),
                        const SizedBox(width: 8.0),
                        Text(value),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 10.0),
            Expanded(
              child: InAppWebView(
                initialUrlRequest: URLRequest(
                  url: WebUri.uri(
                    Uri.parse(
                        Provider.of<SearchProvider>(context, listen: false)
                            .searchUrl),
                  ),
                ),
                onWebViewCreated: (InAppWebViewController controller) {
                  _searchViewController = controller;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
