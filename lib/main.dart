import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/pages/detail/detail_page.dart';
import 'pages/home/home_page.dart';

void main() {
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
          transitionDuration: const Duration(milliseconds: 200),
        ),
        GetPage(
          name: '/detail',
          page: () => const DetailPage(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(milliseconds: 200),
        ),
      ],
      home: HomePage(),
    );
  }
}

