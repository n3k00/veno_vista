import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:veno_vista/controllers/main_controller.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.put(MainController());
    return Scaffold(
      body: Navigator(
        key: Get.nestedKey(1),
        initialRoute: '/home',
        onGenerateRoute: mainController.onGenerateRoute,
      ),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.house,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.bookmark),
              label: "Favourite",
            ),
          ],
          currentIndex: mainController.currentIndex.value,
          selectedItemColor: Colors.cyan,
          onTap: mainController.changePage,
        );
      }),
    );
  }
}
