import 'package:flutter/material.dart';

class ListaPesos extends StatelessWidget {

  final List<double> pesos;

  ListaPesos({
    Key? key,
    required this.pesos  
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      
      itemCount: pesos.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(pesos[index].toString(), style: TextStyle(color: Theme.of(context).primaryColor),),
        );
      },
    );
  }
}