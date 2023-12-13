import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:veno_vista/resources/constants.dart';

import '../models/snake_vo.dart';

class LoadJsonData {
  Future<List<SnakeVO>> loadData() async {
    final jsonData = await rootBundle.loadString(data_resource);
    List<dynamic> responseData = jsonDecode(jsonData);
    List<SnakeVO> snakeList =
        responseData.map((e) => SnakeVO.fromJson(e)).toList();
    return Future.value(snakeList);
  }
}
