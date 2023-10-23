import 'package:flutter/material.dart';
import 'dart:math' show Random;

class AnimatedScreen extends StatefulWidget {
   
  const AnimatedScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  
  double _width = 100;
  double _heigth = 100;
  Color _color = Colors.red;
  BorderRadiusGeometry _borderRadios = BorderRadius.circular(20);

  void animatedContainer () {
    final random = Random();
    _width  = random.nextInt(300).toDouble() + 70;
    _heigth = random.nextInt(300).toDouble() + 70;
    _color = Color.fromRGBO(
      random.nextInt(255),
      random.nextInt(255), 
      random.nextInt(255), 
      1
    );
    _borderRadios = BorderRadius.circular(random.nextInt(100).toDouble() + 10);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOutCubic,
          width: _width,
          height: _heigth,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: _borderRadios
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: animatedContainer,
        child: const Icon(Icons.play_circle_outlined, size: 40),
      ),
    );
  }
}