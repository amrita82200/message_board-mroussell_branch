import 'package:flutter/material.dart';

class GreetingPage  extends StatelessWidget {
  final Color color;

  GreetingPage(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}