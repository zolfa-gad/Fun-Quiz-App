import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnimationCall extends StatelessWidget {
  const AnimationCall({
    super.key,
    required this.child,
    this.seconds = 1,
  });

  final Widget child;
  final int seconds;

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: 1,
      child: SlideAnimation(
        verticalOffset: -200,
        child: FadeInAnimation(
          duration: Duration(seconds: seconds),
          child: child,
        ),
      ),
    );
  }
}
