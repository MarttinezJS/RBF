import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {

  final void Function()? onPressed;
  final String texto;
  final double size;
  
  const CustomButtom({ Key? key, 
    required this.onPressed,
    required this.texto, 
    this.size = 14
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Text( texto, style: TextStyle(color: Colors.white, fontSize: size ), ),
      color: Theme.of(context).primaryColor,
      elevation: 5,
      disabledColor: Theme.of(context).disabledColor,
      onPressed: onPressed
    );
  }
}