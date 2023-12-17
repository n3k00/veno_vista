import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:veno_vista/controllers/favorite_controller.dart';
import 'package:veno_vista/models/snake_vo.dart';
import 'package:veno_vista/networks/load_json_data.dart';
import 'package:veno_vista/views/favorite_page.dart';
import 'package:veno_vista/views/home_page.dart';

class HomeController extends GetxController {
  var isLoading = true.obs;
  var originalSnakeList = <SnakeVO>[].obs;
  var filterSnakeList = <SnakeVO>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    try {
      isLoading(true);
      await Future.delayed(Duration(seconds: 1));
      List<SnakeVO> data = await LoadJsonData().loadData();
      filterSnakeList.assignAll(data);
      originalSnakeList.assignAll(data);
    } finally {
      isLoading(false);
    }
  }

  void filterSnakes(String value) {
    filterSnakeList.assignAll(originalSnakeList.where((snake) {
      return snake.mmName.contains(value);
    }).toList());
  }
}
