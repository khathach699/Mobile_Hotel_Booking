import 'package:flutter/material.dart';
import 'package:hotel_booking/app.dart';
import 'package:hotel_booking/di/di.dart';

void main() {
  setup(); // Khởi tạo DI
  runApp(const MyApp());
}
