import 'package:flutter/material.dart';

class SimpleTextField extends StatelessWidget {
  const SimpleTextField({super.key, required this.fieldName, required this.inputController, this.isObscure});

  final TextEditingController inputController;
  final String fieldName;
  final bool? isObscure;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(fieldName, style: TextStyle(fontSize: 18),),
        TextField(
          controller: inputController,
          decoration: InputDecoration(hintText: fieldName.toLowerCase(), 
            enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 1.3)),
            focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black, width: 1.6))
          ),
          obscureText: isObscure ?? false
        )
      ],
    );
  }
}