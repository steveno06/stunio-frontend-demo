import 'package:flutter/material.dart';

class Header2 extends StatelessWidget {
  const Header2({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(label, style: TextStyle(color: const Color.fromARGB(255, 6, 108, 192), fontSize: 18), textAlign: TextAlign.center,);
  }
}