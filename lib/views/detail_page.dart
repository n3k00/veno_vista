import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veno_vista/controllers/detail_controller.dart';
import 'package:veno_vista/models/snake_vo.dart';
import 'package:veno_vista/resources/dimens.dart';
import 'package:veno_vista/widgets/chip_widget.dart';

class DetailPage extends StatelessWidget {
  final SnakeVO snake = Get.arguments[0];
  @override
  Widget build(BuildContext context) {
    DetailController detailController = Get.put(DetailController());
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverImageBackground(snake: snake),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: MARGIN_MEDIUM,
                    vertical: MARGIN_MEDIUM_2,
                  ),
                  child: SnakeDetailView(snake: snake),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SnakeDetailView extends StatelessWidget {
  const SnakeDetailView({
    super.key,
    required this.snake,
  });

  final SnakeVO snake;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          snake.mmName,
          style: TextStyle(
            fontSize: TEXT_REGULAR_3X,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: MARGIN_MEDIUM),
        Text(
          snake.engName != null ? "( ${snake.engName ?? ""} )" : "",
          style: TextStyle(
            fontSize: MARGIN_MEDIUM_2,
            fontWeight: FontWeight.w300,
          ),
        ),
        SizedBox(height: MARGIN_CARD_MEDIUM_2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ChipWidget(title: "poison", sign: snake.isPoison),
            ChipWidget(title: 'danger', sign: snake.isDanger),
          ],
        ),
        SizedBox(height: MARGIN_CARD_MEDIUM_2),
        Text(
          "\t\t\t${snake.detail}",
          style: TextStyle(height: 1.7),
        ),
        SizedBox(height: MARGIN_CARD_MEDIUM_2),
      ],
    );
  }
}

class SliverImageBackground extends StatelessWidget {
  const SliverImageBackground({
    super.key,
    required this.snake,
  });

  final SnakeVO snake;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: SLIVER_IMAGE_HEIGHT,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          'assets/images/${snake.id}.jpg',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
