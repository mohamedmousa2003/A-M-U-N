import 'package:flutter/material.dart';
import 'auth_animation.dart';

class SelectAuthAnimationImpl implements AuthAnimation {
  final AnimationController _controller;

  @override
  late final Animation<Offset> left;

  @override
  late final Animation<Offset> right;

  @override
  late final Animation<Offset> bottom;

  @override
  late final Animation<Offset> top;



  SelectAuthAnimationImpl({
    required TickerProvider vsync,
    Duration duration = const Duration(milliseconds: 900),
  }) : _controller = AnimationController(
    vsync: vsync,
    duration: duration,
  ) {
    left = _buildSlide(
      begin: const Offset(-1, 0),
      curve: Curves.easeOutCubic,
    );

    right = _buildSlide(
      begin: const Offset(1, 0),
      curve: Curves.easeOutCubic,
    );

    bottom = _buildSlide(
      begin: const Offset(0, 1),
      curve: Curves.easeOutCubic,
    );

    top =_buildSlide(
      begin: const Offset(0, -1),
      curve: Curves.easeOutCubic,
    );
  }

  Animation<Offset> _buildSlide({
    required Offset begin,
    Curve curve = Curves.easeOut,
  }) {
    return Tween<Offset>(
      begin: begin,
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: curve,
      ),
    );
  }

  @override
  void start() => _controller.forward();

  @override
  void dispose() => _controller.dispose();


}
