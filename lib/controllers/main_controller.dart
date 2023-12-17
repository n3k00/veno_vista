import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:veno_vista/controllers/detail_controller.dart';
import 'package:veno_vista/controllers/favorite_controller.dart';
import 'package:veno_vista/views/favorite_page.dart';
import 'package:veno_vista/views/home_page.dart';

import 'favorite_binding.dart';

class MainController extends GetxController {
  var currentIndex = 0.obs;

  final pages = <String>['/home', '/favorite'];

  void changePage(int index) {
    currentIndex.value = index;
    //Get.toNamed(pages[index], id: 1);
    Get.offNamed(pages[index], id: 1, preventDuplicates: true);
  }

  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == '/home') {
      return GetPageRoute(
        page: () => HomePage(),
        binding: BindingsBuilder(() {
          // Use Get.lazyPut for lazy initialization
          Get.lazyPut<DetailController>(() => DetailController());
        }),
      );
    }

    if (settings.name == '/favorite') {
      return GetPageRoute(
        page: () => FavoritePage(),
        binding: BindingsBuilder(() {
          // Use Get.lazyPut for lazy initialization
          Get.lazyPut<FavoriteController>(() => FavoriteController());
        }),
      );
    }
    return null;
  }
}
