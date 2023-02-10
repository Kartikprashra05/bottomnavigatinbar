import 'package:bottomnavigation/common_widget/app_bar.dart';
import 'package:bottomnavigation/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'bikepage.dart';
import 'carpage.dart';
import 'controller_home.dart';

class MapPage extends StatelessWidget {
  MapPage({Key? key}) : super(key: key);
  final _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
          appBar: AppBar(
            bottom:  TabBar(
              indicatorColor: Colors.black,
              controller: _controller.tabController,
              tabs: [
              Tab(icon: Icon(Icons.directions_car,color: Colors.black,)),
              Tab(icon: Icon(Icons.directions_bike,color: Colors.black,)),
            ],
            ) ,
          ),
        body:TabBarView(
            controller: _controller.tabController,
            children: [
              CarPage(),
              MultiSelectList(items: ["kk",'kkkk','kamk','kdm'],),
            ],
          ),


    );



  }
}
