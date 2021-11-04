import 'package:flutter/material.dart';

class CustomInput<T> extends StatelessWidget {

  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;


  const CustomInput({
    Key? key,
    this.keyboardType = TextInputType.text,
    required this.label,
    required this.controller,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {

    final color = Theme.of(context).primaryColor;

    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      cursorColor: color,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.bold 
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle( color: color ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: color,
          )
        ),
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all( Radius.circular( 10 ) ),
          borderSide: BorderSide(
            color: color,
            style: BorderStyle.solid
          )
        ),
      ),
      textCapitalization: TextCapitalization.sentences,
    );
  }
}