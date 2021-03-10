import 'package:flutter/material.dart';

class ZoomInRoute extends PageRouteBuilder {

  ZoomInRoute({this.child}): super(
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionDuration: const Duration(milliseconds: 500),
      transitionsBuilder: (context, animation, secondaryAnimation, Widget child) {
        return ScaleTransition(
          scale: Tween<double>(
            begin: 2.0,
            end: 1.0,
          ).animate(animation),
          child: FadeTransition(
            opacity: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(animation),
            child: child,
          ),
        );
      }
  );

  final Widget child;
}