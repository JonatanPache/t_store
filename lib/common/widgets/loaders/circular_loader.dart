import 'package:flutter/material.dart';

/// A widget for circular loading indicator with optional text and action button
class TCircularLoader extends StatelessWidget {
  const TCircularLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform.scale(
        scale: 0.75,
        child: const CircularProgressIndicator(
          backgroundColor: Colors.cyan,
          color: Colors.red,
          strokeWidth: 2,
        ),
      ),
    );
  }
}
