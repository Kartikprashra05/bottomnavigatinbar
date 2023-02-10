import 'package:bottomnavigation/common_widget/app_bar.dart';
import 'package:bottomnavigation/controller_home.dart';
import 'package:bottomnavigation/setting_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'mappage.dart';



class HomePage extends StatelessWidget {
 HomePage({Key? key}) : super(key: key);
  final _controller = Get.put(HomeController());
  static  List<Widget> _widgetOptions = <Widget>[
      MapPage(),
    MyHomePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(
        ()=> Scaffold(
          drawer: Drawer(),
        appBar: commonappbar("HomePage", Icon(Icons.add)),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            border: Border.all(width: 2,color: Colors.black)
          ),
          child: BottomNavigationBar(
            currentIndex: _controller.selectedIndex.value,
            onTap: (value){
              _controller.isSelectedIndex(value);
            },
            items: [
              BottomNavigationBarItem(
                label: "Home",
                  icon: Icon(Icons.home),
                  backgroundColor: Colors.green
              ),
              BottomNavigationBarItem(
                label: "Serach",
                  icon: Icon(Icons.settings),
                  backgroundColor: Colors.yellow
              ),
            ],
          ),
        ),
        body: SafeArea(
          bottom: false,
          child: _widgetOptions.elementAt(_controller.selectedIndex.value),
        ),
      ),
    );
  }
}
