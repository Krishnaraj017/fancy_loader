
//This is the example code for fancy_loader
import 'package:flutter/material.dart';
import 'package:fancy_loader/fancy_loader.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FancyLoader(
                animationType: AnimationType.gradient,
                size: 50.0,
                duration: Duration(milliseconds: 1000),
              ),
              SizedBox(height: 20),
              FancyLoader(
                animationType: AnimationType.pulsing,
                size: 50.0,
                duration: Duration(milliseconds: 800),
              ),
              SizedBox(height: 20),
              FancyLoader(
                animationType: AnimationType.rotating,
                size: 50.0,
                duration: Duration(milliseconds: 1200),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
