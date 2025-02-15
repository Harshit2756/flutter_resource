import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedBackground extends StatefulWidget {
  final Widget? child;
  final AnimatedBackgroundConfig config;
  final Offset? customOrigin;

  const AnimatedBackground({
    super.key,
    this.child,
    this.config = const AnimatedBackgroundConfig(),
    this.customOrigin,
  });

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class AnimatedBackgroundConfig {
  final int numberOfParticles;
  final double minParticleSize;
  final double maxParticleSize;
  final double minSpeed;
  final double maxSpeed;
  final double connectionDistance;
  final double connectionOpacity;
  final Color particleColor;
  final Color backgroundColor;
  final bool enableConnections;
  final Duration animationDuration;
  final Curve animationCurve;
  final ParticleOrigin particleOrigin;
  final double spreadRadius;
  final BlendMode? particleBlendMode;
  final List<Color>? particleGradientColors;
  final double? particleGlowRadius;
  final bool randomizeParticleColors;

  const AnimatedBackgroundConfig({
    this.numberOfParticles = 100,
    this.minParticleSize = 1,
    this.maxParticleSize = 3,
    this.minSpeed = 0.1,
    this.maxSpeed = 0.6,
    this.connectionDistance = 100,
    this.connectionOpacity = 0.1,
    this.particleColor = Colors.white,
    this.backgroundColor = Colors.black,
    this.enableConnections = true,
    this.animationDuration = const Duration(milliseconds: 200),
    this.animationCurve = Curves.linear,
    this.particleOrigin = ParticleOrigin.center,
    this.spreadRadius = 200,
    this.particleBlendMode,
    this.particleGradientColors,
    this.particleGlowRadius,
    this.randomizeParticleColors = false,
  });
}

class Particle {
  double x;
  double y;
  double radius;
  double speed;
  double direction;
  Color color;

  Particle({
    required this.x,
    required this.y,
    required this.radius,
    required this.speed,
    required this.direction,
    required this.color,
  });

  void update(Size size) {
    x += cos(direction) * speed;
    y += sin(direction) * speed;

    if (x < 0 || x > size.width) {
      direction = pi - direction;
    }
    if (y < 0 || y > size.height) {
      direction = -direction;
    }
  }
}

enum ParticleOrigin {
  center,
  topLeft,
  topRight,
  bottomLeft,
  bottomRight,
  custom,
}

class ParticlePainter extends CustomPainter {
  final List<Particle> particles;
  final AnimatedBackgroundConfig config;

  ParticlePainter(this.particles, this.config);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(
      Offset.zero & size,
      Paint()..color = config.backgroundColor,
    );

    final paint = Paint()
      ..style = PaintingStyle.fill
      ..blendMode = config.particleBlendMode ?? BlendMode.srcOver;

    for (var particle in particles) {
      particle.update(size);

      if (config.particleGlowRadius != null) {
        final glowPaint = Paint()
          ..color = particle.color.withValues(alpha: 0.2)
          ..maskFilter = MaskFilter.blur(
            BlurStyle.normal,
            config.particleGlowRadius!,
          );
        canvas.drawCircle(
          Offset(particle.x, particle.y),
          particle.radius + config.particleGlowRadius!,
          glowPaint,
        );
      }

      if (config.particleGradientColors != null) {
        paint.shader = RadialGradient(
          colors: config.particleGradientColors!,
        ).createShader(
          Rect.fromCircle(
            center: Offset(particle.x, particle.y),
            radius: particle.radius,
          ),
        );
      } else {
        paint.color = particle.color;
      }

      canvas.drawCircle(
        Offset(particle.x, particle.y),
        particle.radius,
        paint,
      );

      if (config.enableConnections) {
        _drawConnections(canvas, particle, paint, size);
      }
    }
  }

  @override
  bool shouldRepaint(ParticlePainter oldDelegate) => true;

  void _drawConnections(
      Canvas canvas, Particle particle, Paint paint, Size size) {
    for (var other in particles) {
      if (particle == other) continue;

      final distance = sqrt(
        pow(particle.x - other.x, 2) + pow(particle.y - other.y, 2),
      );

      if (distance < config.connectionDistance) {
        paint.color = particle.color.withValues(
            alpha: config.connectionOpacity *
                (1 - distance / config.connectionDistance));
        canvas.drawLine(
          Offset(particle.x, particle.y),
          Offset(other.x, other.y),
          paint,
        );
      }
    }
  }
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {
  late List<Particle> particles;
  late AnimationController _controller;
  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return CustomPaint(
              painter: ParticlePainter(particles, widget.config),
              size: Size.infinite,
            );
          },
        ),
        if (widget.child != null) widget.child!,
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.config.animationDuration,
    )..repeat();

    particles = List.generate(
      widget.config.numberOfParticles,
      (index) => _createParticle(Size.zero),
    );
  }

  Particle _createParticle(Size size) {
    final origin = _getInitialPosition(size);
    final angle = random.nextDouble() * 2 * pi;
    final distance = random.nextDouble() * widget.config.spreadRadius;

    final x = origin.dx + cos(angle) * distance;
    final y = origin.dy + sin(angle) * distance;

    final color = widget.config.randomizeParticleColors &&
            widget.config.particleGradientColors != null
        ? widget.config.particleGradientColors![
            random.nextInt(widget.config.particleGradientColors!.length)]
        : widget.config.particleColor;

    return Particle(
      x: x,
      y: y,
      radius: random.nextDouble() *
              (widget.config.maxParticleSize - widget.config.minParticleSize) +
          widget.config.minParticleSize,
      speed: random.nextDouble() *
              (widget.config.maxSpeed - widget.config.minSpeed) +
          widget.config.minSpeed,
      direction: random.nextDouble() * 2 * pi,
      color: color.withValues(alpha: random.nextDouble() * 0.2),
    );
  }

  Offset _getInitialPosition(Size size) {
    switch (widget.config.particleOrigin) {
      case ParticleOrigin.center:
        return Offset(size.width / 2, size.height / 2);
      case ParticleOrigin.topLeft:
        return Offset.zero;
      case ParticleOrigin.topRight:
        return Offset(size.width, 0);
      case ParticleOrigin.bottomLeft:
        return Offset(0, size.height);
      case ParticleOrigin.bottomRight:
        return Offset(size.width, size.height);
      case ParticleOrigin.custom:
        return widget.customOrigin ?? Offset(size.width / 2, size.height / 2);
    }
  }
}
