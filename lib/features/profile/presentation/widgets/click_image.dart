import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'design_image.dart';

class AnimatedImageDialog extends StatefulWidget {
  const AnimatedImageDialog({super.key});

  @override
  State<AnimatedImageDialog> createState() => _AnimatedImageDialogState();
}

class _AnimatedImageDialogState extends State<AnimatedImageDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      insetPadding: const EdgeInsets.all(20),
      child: SlideTransition(
        position: _slideAnimation,
        child: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
            ),
            padding: EdgeInsets.all(16.r),
            child: DesignImage(
              width: double.infinity,
              height: 250.h,
              isCircle: false,
            ),
          ),
        ),
      ),
    );
  }
}