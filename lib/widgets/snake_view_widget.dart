import 'package:flutter/material.dart';
import 'package:veno_vista/models/snake_vo.dart';
import 'package:veno_vista/resources/dimens.dart';
import 'package:get/get.dart';

class SnakeViewWidget extends StatelessWidget {
  const SnakeViewWidget({
    super.key,
    required this.snake,
  });

  final SnakeVO snake;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed("/home/detail", arguments: [snake]);
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
