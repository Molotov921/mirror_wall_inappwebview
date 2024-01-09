import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/all_mirror_provider.dart';
import '../webpage/screens/webpage.dart';

class Bookmark extends StatefulWidget {
  const Bookmark({super.key});

  @override
  State<Bookmark> createState() => _BookmarkDesignState();
}

class _BookmarkDesignState extends State<Bookmark> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Save'),
        centerTitle: true,
      ),
      body: ListView(
        children: Provider.of<WebServProvider>(context).bookmarks.map((e) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Webpage(url: e.url),
                ),
              );
            },
            child: Card(
              elevation: 8,
              margin: const EdgeInsets.all(10),
              child: Container(
                alignment: Alignment.center,
                height: 45,
                width: double.infinity,
                child: Text(
                  e.title,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
