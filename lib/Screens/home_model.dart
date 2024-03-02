import 'package:flutter/material.dart';

class HomeModel {
  final String name;
  final Widget page;
  final IconData icon;
  HomeModel({
    required this.name,
    required this.page,
    required this.icon,
  });
}