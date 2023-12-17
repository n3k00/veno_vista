import 'package:flutter/material.dart';
import 'package:veno_vista/views/detail_page.dart';
import 'package:veno_vista/views/home_page.dart';
import 'package:get/get.dart';

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
      initialRoute: '/home',
      getPages: [
        GetPage(name: '/home', page: () => HomePage()),
        GetPage(name: '/home/detail', page: () => DetailPage()),
      ],
    );
  }
}
