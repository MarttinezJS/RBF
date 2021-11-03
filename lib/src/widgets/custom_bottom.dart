import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {

  final void Function()? onPressed;
  final Text texto;
  final double ancho;
  final double alto;
  
  const CustomButtom({ Key? key, 
    required this.onPressed,
    required this.texto, 
    required this.ancho,
    required this.alto
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialButton(
      child: texto,
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.symmetric( vertical: alto, horizontal: ancho),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular( 20 )
      ),
      disabledColor: Theme.of(context).disabledColor,
      onPressed: onPressed
    );
  }
}