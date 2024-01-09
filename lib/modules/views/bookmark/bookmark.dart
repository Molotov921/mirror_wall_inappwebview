import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/all_mirror_provider.dart';

class Bookmark extends StatelessWidget {
  const Bookmark({super.key});

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
              Navigator.of(context).pushNamed('webpage', arguments: e);
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
