import 'package:flutter/material.dart';
import 'dart:math' as math;

class RotatableImage extends StatefulWidget {
  final String imagePath;

  RotatableImage({required this.imagePath});

  @override
  _RotatableImageState createState() => _RotatableImageState();
}

class _RotatableImageState extends State<RotatableImage> {
  double _rotationX = 0.0;
  double _rotationY = 0.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          // Adjust sensitivity by scaling details.delta
          _rotationY += details.delta.dx * 0.01;
          _rotationX -= details.delta.dy * 0.01;
        });
      },
      child: Transform(
        alignment: FractionalOffset.center,
        transform: Matrix4.identity()
          ..rotateX(_rotationX)
          ..rotateY(_rotationY),
        child: Image.asset(widget.imagePath),
      ),
    );
  }
}
