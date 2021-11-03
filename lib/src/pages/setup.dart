import 'package:flutter/material.dart';

class Setup extends StatelessWidget {
  const Setup({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuracion de la red'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only( top: size.height * 0.04),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            formularioDatos(),
            cuadroInforme()
          ],
        ),
      ),
    );
  }

  formularioDatos(){
    return Column(
      children: const [
        Card(
          elevation: 10,
          child: SizedBox(
            height: 400,
            width: 400,
          )
        )
      ],
    );
  }

  cuadroInforme(){
    return Column(
      children: const [
        Card(
          elevation: 10,
          child: SizedBox(
            height: 400,
            width: 400,
          )
        )
      ],
    );
  }
}