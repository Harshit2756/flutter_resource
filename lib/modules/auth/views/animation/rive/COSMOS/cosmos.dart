import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class Cosmos extends StatelessWidget {
  const Cosmos({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: RiveAnimation.asset('assets/rive/bgAnimation.riv'),
      ),
    );
  }
}
