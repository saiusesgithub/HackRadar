import 'package:flutter/material.dart';

class SwipeableCard extends StatelessWidget {
  final Widget child;
  const SwipeableCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Color(0xFF1A1A1F),
        border: Border.all(color: const Color(0xff00ffd5), width: 2.0),
      ),
      child: child,
    );
  }
}
