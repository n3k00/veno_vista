import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:veno_vista/models/snake_vo.dart';
import 'package:veno_vista/networks/load_json_data.dart';

class FavoriteController extends GetxController {
  var isLoading = true.obs;
  var favoriteSnakeList = <SnakeVO>[].obs;
  final box = GetStorage('VenoVista');

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    try {
      isLoading(true);
      await Future.delayed(Duration(seconds: 1));
      List<SnakeVO> storedList = box.read<List<SnakeVO>>("favorite") ?? [];
      favoriteSnakeList.addAll(storedList);
      print("Test Fav");
      print(favoriteSnakeList);
    } finally {
      isLoading(false);
    }
  }
}
