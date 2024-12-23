import 'package:flutter/material.dart';

class SimpleButton extends StatelessWidget {
  const SimpleButton({super.key, required this.onPressed, required this.label});

  final VoidCallback onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 22, right: 22, top: 0, bottom: 0),
      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: const Color.fromARGB(255, 6, 108, 192)),
      child: TextButton(onPressed: onPressed, child: Text(label, style: TextStyle(color: Colors.white, fontSize: 16),)),
    );
  }
}