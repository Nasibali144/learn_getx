// Dependency Injection
// Singleton

import 'package:get/get.dart';
import 'package:learn_getx/pages/detail/detail_controller.dart';
import 'package:learn_getx/pages/home/home_controller.dart';

class DIService {
  static Future<void> init() async {
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<DetailController>(() => DetailController(), fenix: true);
  }
}