import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mirror Wall App'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.of(context).pushNamed('search');
            },
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'bookmarks') {
                Navigator.of(context).pushNamed('bookmarks');
              }
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem<String>(
                value: 'bookmarks',
                child: Row(
                  children: [
                    Icon(Icons.star_outline),
                    SizedBox(width: 8),
                    Text('Bookmarks'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('detail');
                },
                child: Card(
                  elevation: 0,
                  child: Container(
                    alignment: const Alignment(0, 0),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent[100],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: double.infinity,
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: Image.asset(
                        'assets/images/educational_logo.png',
                        height: 300,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('detail2');
                },
                child: Card(
                  elevation: 0,
                  child: Container(
                    alignment: const Alignment(0, 0),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent[100],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: double.infinity,
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: Image.asset(
                        'assets/images/ott_platforms_logo.png',
                        height: 300,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('detail3');
                },
                child: Card(
                  elevation: 0,
                  child: Container(
                    alignment: const Alignment(0, 0),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent[100],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: double.infinity,
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: Image.asset(
                        'assets/images/search_engine_logo.png',
                        height: 300,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
