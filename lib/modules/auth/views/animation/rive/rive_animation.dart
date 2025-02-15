import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class RiveCardAnimation extends StatefulWidget {
  const RiveCardAnimation({super.key});

  @override
  RiveCardAnimationState createState() => RiveCardAnimationState();
}

class RiveCardAnimationState extends State<RiveCardAnimation> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: RiveAnimation.asset('rive/gg_htt.riv'),
      ),
    );
  }
}
