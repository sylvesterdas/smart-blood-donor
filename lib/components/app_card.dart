
import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {

  final Widget child;
  final EdgeInsets _margin;
  final double _elevation;

  AppCard({@required this.child, EdgeInsets margin, double elevation})
    : _margin = margin ?? EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      _elevation = elevation ?? 1.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 100,
      child: Card(
        elevation: _elevation,
        margin: _margin,
        child: child,
      ),
    );
  }

}