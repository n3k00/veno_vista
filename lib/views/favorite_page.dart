import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:veno_vista/controllers/favorite_controller.dart';
import 'package:veno_vista/models/snake_vo.dart';
import 'package:veno_vista/resources/dimens.dart';
import 'package:veno_vista/widgets/snake_view_widget.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(MARGIN_MEDIUM),
          child: Column(
            children: [
              Expanded(
                child: Obx(
                  () {
                    final FavoriteController favoriteController =
                        Get.find<FavoriteController>();
                    if (favoriteController.isLoading.value) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      if (favoriteController.favoriteSnakeList.isEmpty) {
                        return Center(
                          child: Text("There is no favorite"),
                        );
                      } else {
                        return MasonryGridView.count(
                          crossAxisSpacing: MARGIN_MEDIUM_10,
                          crossAxisCount: 2,
                          itemCount:
                              favoriteController.favoriteSnakeList.length,
                          mainAxisSpacing: MARGIN_MEDIUM_10,
                          itemBuilder: (context, index) {
                            SnakeVO snake =
                                favoriteController.favoriteSnakeList[index];
                            return GestureDetector(
                              onTap: () {
                                Get.toNamed("/home/detail", arguments: [snake]);
                              },
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                        bottom: MARGIN_MEDIUM_10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          BORDER_RADIUS_SIZE_10),
                                      //color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.white.withOpacity(0.1),
                                          //blurRadius: 5,
                                          spreadRadius: 1,
                                          offset: Offset(1, 1),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              BORDER_RADIUS_SIZE_10),
                                          child: Image.asset(
                                            "assets/images/${snake.id}.jpg",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            right: MARGIN_MEDIUM,
                                            left: MARGIN_MEDIUM,
                                            top: MARGIN_MEDIUM_10,
                                          ),
                                          child: Text(
                                            snake.mmName,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
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
