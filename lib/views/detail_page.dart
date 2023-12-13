import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veno_vista/models/snake_vo.dart';

class DetailPage extends StatelessWidget {
  final SnakeVO snake = Get.arguments[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 280.0,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/${snake.id}.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            snake.mmName,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            "( ${snake.engName ?? ""} )",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Chip(
                            label: Text("အန္တရာယ်ရှိ"),
                            avatar: CircleAvatar(
                              backgroundColor: Colors.green,
                            ),
                          ),
                          Chip(
                            label: Text("အဆိပ်ရှိ"),
                            avatar: CircleAvatar(
                              backgroundColor: Colors.red,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Text(
                        "\t\t\t${snake.detail}",
                        style: TextStyle(height: 1.7),
                      ),
                      SizedBox(height: 12),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
