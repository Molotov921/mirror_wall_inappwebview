import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mirror Wall App'),
        centerTitle: true,
        // leading: ,
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
                // onTap: () {
                //   Navigator.of(context).pushNamed('detail3');
                // },
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
