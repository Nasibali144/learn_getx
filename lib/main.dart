import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/pages/detail/detail_page.dart';
import 'package:learn_getx/services/di_service.dart';
import 'pages/home/home_page.dart';

void main() async {
  await DIService.init();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(
          name: '/home',
          page: () => HomePage(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: '/detail',
          page: () => const DetailPage(),
          transition: Transition.leftToRightWithFade,
        ),
      ],
      home: HomePage(),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

