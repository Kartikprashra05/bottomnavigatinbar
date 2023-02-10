import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class MultiSelectList extends StatelessWidget {
  final List<String> items;
  final Function(List<String>)? onChanged;

  MultiSelectList({required this.items, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MultiSelectController>(
      init: MultiSelectController(),
      builder: (_) => ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return CheckboxListTile(
            title: Text(items[index]),
            value: _.selected.contains(items[index]),
            onChanged: (value) {
              _.select(items[index]);
              onChanged!(_.selected);
            },
          );
        },
      ),
    );
  }
}

class MultiSelectController extends GetxController {
  List<String> selected = [];

  void select(String item) {
    if (selected.contains(item)) {
      selected.remove(item);
    } else {
      selected.add(item);
    }
    update();
  }
}
