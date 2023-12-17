import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:veno_vista/models/snake_vo.dart';
import 'package:veno_vista/networks/load_json_data.dart';

class DetailController extends GetxController {
  final box = GetStorage('VenoVista');
  final favoriteList = <SnakeVO>[].obs;
  var isFavorite = false.obs;
  final originalSnakeList = <SnakeVO>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    try {
      await Future.delayed(Duration(seconds: 1));
      List<SnakeVO> data = await LoadJsonData().loadData();
      originalSnakeList.assignAll(data);
      List<SnakeVO> storedList = box.read<List<SnakeVO>>("favorite") ?? [];

      favoriteList.addAll(storedList);
    } finally {}
  }

  void toggleFavorite(SnakeVO snake) {
    if (favoriteList.contains(snake)) {
      favoriteList.remove(snake);
    } else {
      favoriteList.add(snake);
    }
    checkFavorite(snake);
    box.write("favorite", favoriteList);
  }

  void checkFavorite(SnakeVO snake) {
    isFavorite.value =
        favoriteList.any((favoriteSnake) => favoriteSnake.id == snake.id);
  }
}
