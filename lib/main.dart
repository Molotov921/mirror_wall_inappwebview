import 'package:flutter/material.dart';
import 'package:mirror_wall_inappwebview/modules/providers/all_mirror_provider.dart';
import 'package:mirror_wall_inappwebview/modules/views/detailpage/detailpage.dart';
import 'package:mirror_wall_inappwebview/modules/views/webpage/screens/webpage.dart';
import 'package:mirror_wall_inappwebview/modules/views/homepage/screens/homepage.dart';
import 'package:mirror_wall_inappwebview/modules/views/homepage/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ChangeNotifierProvider(
      create: (context) => WebServProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'splash_screen',
        routes: {
          '/': (context) => const HomePage(),
          'splash_screen': (context) => const Splash_Screen(),
          'detail': (context) => const DetailPage(),
          // 'detail2': (context) => const DetailPage2(),
          // 'detail3': (context) => const DetailPage3(),
          'webpage': (context) => const Webpage(),
          // 'webpage2': (context) => const Detailpage2(),
          // 'webpage3': (context) => const DetailPage3(),
        },
      ),
    ),
  );
}
