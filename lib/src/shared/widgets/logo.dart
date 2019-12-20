import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hero(
      key: Key('logoImg'),
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 100.0,
        child: Image.asset('assets/accenture.png'),
      ),
    );
  }
}
