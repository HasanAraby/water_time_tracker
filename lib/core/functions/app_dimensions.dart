import 'package:flutter/material.dart';

double getWidth(BuildContext context) {
  if (MediaQuery.of(context).orientation == Orientation.landscape) {
    return MediaQuery.sizeOf(context).height;
  }
  return MediaQuery.sizeOf(context).width;
}

double getHeight(BuildContext context) {
  if (MediaQuery.of(context).orientation == Orientation.landscape) {
    return MediaQuery.sizeOf(context).width;
  }
  return MediaQuery.sizeOf(context).height;
}
