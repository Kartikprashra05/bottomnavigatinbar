import 'package:bottomnavigation/controller/carpage_controller.dart';
import 'package:bottomnavigation/controller/item_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CarPage extends StatelessWidget {
  CarPage({Key? key}) : super(key: key);
  final carController controller = Get.put(carController());
  final  _refreshController = RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return  Obx(
        ()=> Scaffold(
            body: SmartRefresher(
              enablePullDown: true,
              enablePullUp: true,
              controller: _refreshController,
               onRefresh: (){
                _refreshController.refreshCompleted();
                controller.startTimer();
               },
              child: SafeArea(
                child:Column(
                  children: [
                  Text("${controller.time}"),
                  controller.isSelected.value==true?
                  GestureDetector(onTap: (){
                    controller.isSelected.value=!controller.isSelected.value;
                    controller.startTimer();


                  }, child: Text("Ok")):Container(),

                  SizedBox(height: 20,),
                   Expanded(
                       child: ListView.builder(
                                  itemCount: controller.item.length,
                                  itemBuilder: (context,index){
                                ItemModel model = controller.item[index];

                                return  ListTile(
                                      leading: Text(model.title!),
                                    trailing:
                                  GestureDetector(
                                    onTap: (){
                                      controller.smeWhere(index);
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        color: model.checked!?Colors.black:Colors.blue,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                  )
                                  /*Checkbox(value: model.checked, onChanged: ( value) {
                                      controller.smeWhere(index);
                                    },
                                    ),*/
                                );

                              }),
                     ),

                  ],
                ),
              ),
            ),



      ),
    );
  }
}
