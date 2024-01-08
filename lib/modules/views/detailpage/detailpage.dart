import 'package:flutter/material.dart';
import 'package:mirror_wall_inappwebview/modules/providers/all_mirror_provider.dart';
import 'package:provider/provider.dart';
import '../homepage/model/web_model.dart';

class DetailPage extends StatelessWidget {
  final List<WebModel> data;
  final String tname;
  const DetailPage({Key? key, required this.data, required this.tname})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tname),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 4,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
          children: data
              .map(
                (e) => InkWell(
                  onTap: () {
                    Provider.of<WebServProvider>(context, listen: false)
                        .updateSelectedService(e.name);

                    Navigator.of(context).pushNamed('webpage', arguments: e);
                  },
                  child: Card(
                    elevation: 5,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: Image.asset(e.image),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Chip(
                                backgroundColor: Colors.blue,
                                label: Text(
                                  e.name,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
