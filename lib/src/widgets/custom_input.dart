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
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      style: TextStyle(color: Theme.of(context).primaryColor),
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all( Radius.circular( 10 ) ),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            style: BorderStyle.solid
          )
        ),
      ),
      textCapitalization: TextCapitalization.sentences,
    );
  }
}