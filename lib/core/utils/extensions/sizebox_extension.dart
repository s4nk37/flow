import 'package:flutter/material.dart';

extension SpaceXY on double {
  SizedBox get spaceX => SizedBox(width: this); // For horizontal space
  SizedBox get spaceY => SizedBox(height: this); // For vertical space
}
