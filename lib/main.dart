import 'package:backdrop/ui/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Backdrop",
    home: Home(),
    theme: ThemeData(primaryColor: Colors.teal),
    debugShowCheckedModeBanner: false,
  ));
}
