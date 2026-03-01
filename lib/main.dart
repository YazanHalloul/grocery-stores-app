import 'package:flutter/material.dart';
import 'package:technical_assignment/core/DI/injection.dart';
import 'package:technical_assignment/features/storeShop/presentation/pages/Home.dart';

void main() async {
  setupInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home());
  }
}
