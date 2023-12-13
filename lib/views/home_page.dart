import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veno_vista/controllers/home_controller.dart';
import 'package:veno_vista/models/snake_vo.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:veno_vista/resources/dimens.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    homeController.fetchData();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(MARGIN_MEDIUM),
          child: Column(
            children: [
              SearchTextFieldSection(),
              SizedBox(height: MARGIN_MEDIUM_2),
              Expanded(
                child: Obx(
                  () {
                    if (homeController.isLoading.value) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return SnakeGridViewSection(
                          homeController: homeController);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bookmark_outline,
            ),
            label: "Favourite",
          ),
        ],
      ),
    );
  }
}

class SnakeGridViewSection extends StatelessWidget {
  const SnakeGridViewSection({
    super.key,
    required this.homeController,
  });

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
        crossAxisSpacing: MARGIN_MEDIUM_10,
        crossAxisCount: 2,
        itemCount: homeController.filterSnakeList.length,
        mainAxisSpacing: MARGIN_MEDIUM_10,
        itemBuilder: (context, index) {
          SnakeVO snake = homeController.filterSnakeList[index];
          return SnakeViewSection(snake: snake);
        });
  }
}

class SnakeViewSection extends StatelessWidget {
  const SnakeViewSection({
    super.key,
    required this.snake,
  });

  final SnakeVO snake;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed("/detail", arguments: [snake]);
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: MARGIN_MEDIUM_10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(BORDER_RADIUS_SIZE_10),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(BORDER_RADIUS_SIZE_10),
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
  }
}

class SearchTextFieldSection extends StatelessWidget {
  const SearchTextFieldSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find<HomeController>();
    return TextField(
      style: TextStyle(height: 1),
      decoration: InputDecoration(
        hintText: "Search",
        prefixIcon: Icon(Icons.search),
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
    );
  }
}
