import 'package:flutter/material.dart';

class CustomInput<T> extends StatelessWidget {

  final int maxLines;
  final int maxLength;
  final String label;
  final IconData icon;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Stream<T> stream;


  const CustomInput({
    Key? key,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
    required this.maxLength,
    required this.label,
    required this.icon,
    required this.controller,
    required this.stream,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        return TextFormField(
          maxLines: maxLines,
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            icon: Icon(icon, size: 30.0),
            labelText: label,
          ),
          maxLength: maxLength,
          autocorrect: true,
          textCapitalization: TextCapitalization.sentences,
        );
      },
    );
  }
}