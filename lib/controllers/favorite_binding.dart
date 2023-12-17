import 'package:get/get.dart';
import 'package:veno_vista/controllers/favorite_controller.dart';

class FavoriteBinding extends Bindings {
  @override
  void dependencies() {
    // Use Get.lazyPut to initialize the controller lazily
    Get.lazyPut<FavoriteController>(() => FavoriteController());
  }
}
