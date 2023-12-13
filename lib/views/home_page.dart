import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veno_vista/models/snake_vo.dart';
import 'package:veno_vista/networks/load_json_data.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:veno_vista/views/detail_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<SnakeVO>? originalSnakeList;
  List<SnakeVO>? filterSnakeList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LoadJsonData().loadData().then((value) {
      setState(() {
        filterSnakeList = value;
        originalSnakeList = value;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: "ရှာဖွေရန်",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    filterSnakeList = originalSnakeList!.where((snake) {
                      return snake.mmName.contains(value);
                    }).toList();
                  });
                },
              ),
              SizedBox(height: 10),
              Expanded(
                child: filterSnakeList == null
                    ? Center(child: CircularProgressIndicator())
                    : MasonryGridView.count(
                        crossAxisSpacing: 10,
                        crossAxisCount: 2,
                        itemCount: filterSnakeList?.length,
                        mainAxisSpacing: 10,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(() => DetailPage(),
                                  arguments: [filterSnakeList![index]]);
                            },
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
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
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                            "assets/images/${filterSnakeList![index].id}.jpg"),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          right: 8,
                                          left: 8,
                                          top: 10,
                                        ),
                                        child: Text(
                                          filterSnakeList![index].mmName,
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
                        }),
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
