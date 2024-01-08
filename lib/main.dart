import 'package:flutter/material.dart';
import 'package:mirror_wall_inappwebview/modules/views/bookmark/bookmark.dart';
import 'modules/providers/all_mirror_provider.dart';
import 'modules/providers/search_provider.dart';
import 'modules/views/detailpage/detailpage.dart';
import 'modules/views/webpage/screens/webpage.dart';
import 'modules/views/homepage/screens/homepage.dart';
import 'modules/views/homepage/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'modules/utils/global_images_list.dart';
import 'modules/views/searchpage/searchscreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => WebServProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'splash_screen',
        routes: {
          '/': (context) => const HomePage(),
          'splash_screen': (context) => const Splash_Screen(),
          'detail': (context) => DetailPage(
                data: WebModelData.allEduWebData,
                tname: "Educational Websites",
              ),
          'detail2': (context) => DetailPage(
                data: WebModelData.allOttWebData,
                tname: "Ott Platforms",
              ),
          'detail3': (context) => DetailPage(
                data: WebModelData.allSearchData,
                tname: "Search Engines",
              ),
          'webpage': (context) => const Webpage(
                url: '',
              ),
          'search': (context) => const SearchWebPage(),
          'bookmarks': (context) => const Bookmark(),
        },
      ),
    ),
  );
}
