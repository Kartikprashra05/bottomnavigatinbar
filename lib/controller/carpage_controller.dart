import 'dart:async';

import 'package:bottomnavigation/bikepage.dart';
import 'package:get/get.dart';

import 'item_model.dart';

class carController extends GetxController {
  var time = 10.obs;
  var isSelected = true.obs;
  late Timer _timer;
  List<ItemModel>item = [ItemModel(title: "Kartik",),
    ItemModel(title: "Kartik",),
    ItemModel(title: "Kartik",),
    ItemModel(title: "Kartik",),
    ItemModel(title: "Kartik",)];

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (time > 0) {
        time--;
      }else if(time==0){
        startTimer();
        isSelected.value = true;

      }
     /* else if(time == 0){

        Get.to(

          MultiSelectList(items: ["kk",'kkkk','kamk','kdm'],

          ),);
      }*/
    });
  }

  smeWhere(int index) {
    ItemModel se = item[index];
    se.checked = !se.checked!;
    update();
  }
}


