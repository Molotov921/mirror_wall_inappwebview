import 'package:flutter/material.dart';
import 'package:mirror_wall_inappwebview/modules/views/homepage/model/web_model.dart';
import 'package:provider/provider.dart';
import '../../providers/all_mirror_provider.dart';

class Bookmark extends StatelessWidget {
  const Bookmark({super.key});

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
          var bookmark = Provider.of<WebServProvider>(context).bookmarks[index];
          return Column(
            children: [
              InkWell(
                onTap: () {
                  WebModel model = WebModel(
                    name: bookmark.title,
                    image: "",
                    link: bookmark.url,
                  );
                  Navigator.of(context).pushNamed('webpage', arguments: model);
                },
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  title: Text(
                    bookmark.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    bookmark.url,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  trailing: PopupMenuButton<String>(
                    icon: const Icon(Icons.more_vert, color: Colors.black),
                    onSelected: (value) {
                      if (value == 'delete') {
                        Provider.of<WebServProvider>(context, listen: false)
                            .deleteBookmark(index);
                      } else if (value == 'edit') {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Edit Bookmark'),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextField(
                                    controller: Provider.of<WebServProvider>(
                                            context,
                                            listen: false)
                                        .textControllerModel
                                        .titleTxt,
                                    keyboardType: TextInputType.text,
                                    decoration: const InputDecoration(
                                      hintText: 'Enter your New Title',
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
                                          .editBookmark(
                                              index,
                                              Provider.of<WebServProvider>(
                                                      context,
                                                      listen: false)
                                                  .textControllerModel
                                                  .titleTxt
                                                  .text);
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
                      }
                    },
                    itemBuilder: (BuildContext context) {
                      return [
                        const PopupMenuItem<String>(
                          value: 'edit',
                          child: Row(
                            children: [
                              Icon(Icons.edit, color: Colors.blue),
                              SizedBox(width: 8),
                              Text(
                                'Edit',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ],
                          ),
                        ),
                        const PopupMenuItem<String>(
                          value: 'delete',
                          child: Row(
                            children: [
                              Icon(Icons.delete, color: Colors.red),
                              SizedBox(width: 8),
                              Text(
                                'Delete',
                                style: TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                      ];
                    },
                  ),
                ),
              ),
              if (index <
                  Provider.of<WebServProvider>(context).bookmarks.length - 1)
                Container(
                  height: 1,
                  color: Colors.grey[300],
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                ),
            ],
          );
        },
      ),
    );
  }
}
