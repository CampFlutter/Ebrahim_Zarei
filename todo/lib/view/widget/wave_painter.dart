import 'package:flutter/material.dart';

class WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.fill;

    final path = Path();
    path.lineTo(0, size.height * 0.75);

    // Creating a wave effect using a quadratic Bezier curve
    path.quadraticBezierTo(
      size.width * 0.25, size.height, // Control point
      size.width * 0.5, size.height * 0.85, // End point of the first curve
    );
    path.quadraticBezierTo(
      size.width * 0.75, size.height * 0.7, // Control point
      size.width, size.height * 0.85, // End point of the second curve
    );

    path.lineTo(size.width, 0); // Finish the top-right corner
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
