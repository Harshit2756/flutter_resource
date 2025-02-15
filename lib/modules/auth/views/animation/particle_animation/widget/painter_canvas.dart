import 'dart:math';

import 'package:flutter/material.dart';

import 'particle.dart';

Offset polarToCartesian(double speed, double delta) {
  return Offset(speed * cos(delta), speed * sin(delta));
}

class PainterCanvas extends CustomPainter {
  final List<Particle> particleList;
  final Random randomNumber;
  PainterCanvas({
    super.repaint,
    required this.particleList,
    required this.randomNumber,
  });

  @override
  void paint(Canvas canvas, Size size) {
    /// update the object
    for (var particle in particleList) {
      final velocity = polarToCartesian(particle.speed, particle.delta);
      var dx = particle.position.dx + velocity.dx;
      var dy = particle.position.dy + velocity.dy;
      // if position falls outside of the canvas rearrange the position
      if (particle.position.dx < 0 || particle.position.dx > size.width) {
        dx = randomNumber.nextDouble() * size.width;
      }
      if (particle.position.dy < 0 || particle.position.dy > size.height) {
        dy = randomNumber.nextDouble() * size.height;
      }
      particle.position = Offset(dx, dy);
    }

    for (var particle in particleList) {
      var paint = Paint();
      paint.color = particle.color;
      canvas.drawCircle(particle.position, particle.radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
