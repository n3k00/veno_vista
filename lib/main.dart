import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:veno_vista/networks/load_json_data.dart';
import 'package:veno_vista/views/detail_page.dart';
import 'package:veno_vista/views/favorite_page.dart';
import 'package:veno_vista/views/home_page.dart';
import 'package:get/get.dart';
import 'package:veno_vista/views/main_page.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Veno Vista',
      theme: ThemeData.dark(
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => MainPage()),
        GetPage(name: '/home', page: () => HomePage()),
        GetPage(name: '/favorite', page: () => FavoritePage()),
        GetPage(name: '/home/detail', page: () => DetailPage()),
      ],
    );
  }
}
