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
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: SLIVER_IMAGE_HEIGHT,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        'assets/images/${snake.id}.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: MARGIN_MEDIUM,
                      vertical: MARGIN_MEDIUM_2,
                    ),
                    child: Column(
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

                        /// Eng Name
                        Text(
                          snake.engName != null
                              ? "( ${snake.engName ?? ""} )"
                              : "",
                          style: TextStyle(
                            fontSize: MARGIN_MEDIUM_2,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(height: MARGIN_CARD_MEDIUM_2),

                        /// isPoison and isDanger
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ChipWidget(title: "poison", sign: snake.isPoison),
                            ChipWidget(title: 'danger', sign: snake.isDanger),
                          ],
                        ),
                        SizedBox(height: MARGIN_CARD_MEDIUM_2),

                        /// snake detail
                        Text(
                          "\t\t\t${snake.detail}",
                          style: TextStyle(height: 1.7),
                        ),
                        SizedBox(height: MARGIN_CARD_MEDIUM_2),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
