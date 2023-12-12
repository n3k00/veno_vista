import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:veno_vista/resources/constants.dart';

class LoadJsonData {
  void loadData() async {
    final jsonData = await rootBundle.loadString(data_resource);
    final data = jsonDecode(jsonData);
  }
}
