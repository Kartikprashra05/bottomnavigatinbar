import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with SingleGetTickerProviderMixin{
  late TabController tabController;
  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    // TODO: implement onInit
    super.onInit();
  }
var selectedIndex = 0.obs;
isSelectedIndex(int val){
  selectedIndex.value = val;
}
}