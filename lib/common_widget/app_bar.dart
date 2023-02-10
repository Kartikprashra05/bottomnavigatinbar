import 'package:flutter/material.dart';

AppBar commonappbar(String title,Widget icon,){
  return AppBar(
    title: Text(title),
    actions: [icon],

  );
}