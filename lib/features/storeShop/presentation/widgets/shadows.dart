import 'package:flutter/material.dart';

List<BoxShadow> get boxShadow {
  return [
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.16),
      blurRadius: 6,
      spreadRadius: 0,
      offset: Offset(0, 3),
    ),
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.23),
      blurRadius: 6,
      spreadRadius: 0,
      offset: Offset(0, 3),
    ),
  ];
}

List<BoxShadow> get boxShadow2 {
  return [
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.15),
      blurRadius: 3,
      spreadRadius: 0,
      offset: Offset(0, 3),
    ),
  ];
}