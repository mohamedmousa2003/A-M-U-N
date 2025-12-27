import 'package:flutter/material.dart';

abstract class AuthAnimation {
  Animation<Offset> get left;
  Animation<Offset> get right;
  Animation<Offset> get bottom;
  Animation<Offset> get top;

  void start();
  void dispose();
}
