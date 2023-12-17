import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:veno_vista/controllers/home_controller.dart';
import 'package:veno_vista/models/snake_vo.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:veno_vista/resources/dimens.dart';
import 'package:veno_vista/widgets/snake_view_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(MARGIN_MEDIUM),
          child: Column(
            children: [
              TextField(
                style: TextStyle(height: 1),
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: Icon(FontAwesomeIcons.magnifyingGlass),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(BORDER_RADIUS_SIZE_10),
                    borderSide: BorderSide(width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(BORDER_RADIUS_SIZE_10),
                    borderSide: BorderSide(width: 2, color: Colors.grey),
                  ),
                ),
                onChanged: (value) {
                  homeController.filterSnakes(value);
                },
              ),
              SizedBox(height: MARGIN_MEDIUM_2),
              Expanded(
                child: Obx(
                  () {
                    if (homeController.isLoading.value) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      if (homeController.filterSnakeList.isEmpty) {
                        return Center(
                          child: Text("Not Found"),
                        );
                      } else {
                        return MasonryGridView.count(
                          crossAxisSpacing: MARGIN_MEDIUM_10,
                          crossAxisCount: 2,
                          itemCount: homeController.filterSnakeList.length,
                          mainAxisSpacing: MARGIN_MEDIUM_10,
                          itemBuilder: (context, index) {
                            SnakeVO snake =
                                homeController.filterSnakeList[index];
                            return SnakeViewWidget(snake: snake);
                          },
                        );
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
