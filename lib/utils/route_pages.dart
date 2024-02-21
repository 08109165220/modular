import 'package:flutter/material.dart';
import 'package:modeler/Screen/nav.dart';
import 'package:modeler/home_model/home_details.dart';

Map<String, Widget Function(BuildContext)> routes = {
  Nav.route(): (context) => Nav(),
  Trial.route(): (context) => Trial()
};
