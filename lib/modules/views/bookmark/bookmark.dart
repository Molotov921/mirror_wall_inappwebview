import 'package:flutter/material.dart';
import 'package:mirror_wall_inappwebview/modules/providers/all_mirror_provider.dart';
import 'package:provider/provider.dart';
import '../webpage/screens/webpage.dart';

class Bookmark extends StatelessWidget {
  const Bookmark({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmarks'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: Provider.of<WebServProvider>(context).bookmarks.length,
        itemBuilder: (context, index) {
          final bookmark =
              Provider.of<WebServProvider>(context).bookmarks[index];

          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Webpage(url: bookmark.url),
                ),
              );
            },
            child: Card(
              elevation: 8,
              margin: const EdgeInsets.all(10),
              child: Container(
                alignment: Alignment.center,
                height: 80,
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bookmark.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      bookmark.url,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
