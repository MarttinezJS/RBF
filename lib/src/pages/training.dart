import 'package:flutter/material.dart';
import 'package:rbr/src/utils/datos_convert.dart';
import 'package:rbr/src/widgets/backgrounds.dart';
import 'package:rbr/src/widgets/custom_bottom.dart';
import 'package:rbr/src/widgets/custom_input.dart';

class Training extends StatefulWidget {
  

  const Training({ Key? key }) : super(key: key);

  @override
  State<Training> createState() => _TrainingState();
}

class _TrainingState extends State<Training> {

  final datosConvert = DatosConvert();
  final radialCentersController = TextEditingController();
  bool datosCargados = false;
  bool redLista = false;
  

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Entrenamiento De La Red'),
      ),
      body:  Container(
        color: Theme.of(context).backgroundColor,
        width: size.width,
        height: size.height,
        child: BackgoundSetup(
          color : Colors.brown[800]!,
          child: SingleChildScrollView(
            padding: EdgeInsets.only( top: size.height * 0.04),
            child : Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _card(size, redConfig(size, primaryColor)),
                _card(size, trainingConfig(size))
              ],
            ),
          ),
        ),
      ),
    );
  }

  redConfig(Size size, Color color){
    return Container(
      margin: EdgeInsets.symmetric( vertical: size.height * 0.02, horizontal: size.width * 0.04),
      child: Column(
        children: [
          _cuadroDatos(size, color),
          SizedBox( height: size.height * 0.02,),
          _cuadroEntrenamiento(),
        ],
      ),
    );
  }

  Container _cuadroDatos(Size size, Color color) {
    return Container(
        decoration: _decorador(),
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox( height: size.height * 0.01,),
            CustomButtom(
              texto: 'Cargar Datos',
              onPressed: () async {
                await datosConvert.cargarCSV();
                setState(() {});
              }, 
            ),
            SizedBox( height: size.height * 0.01,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox( width: size.width * 0.01),
                Text('Entradas: ${datosConvert.nEntradas}', style: TextStyle(color: color, fontWeight: FontWeight.bold),),
                SizedBox( width: size.width * 0.01),
                Text('Salidas: ${datosConvert.nSalidas}', style: TextStyle(color: color, fontWeight: FontWeight.bold),),
                SizedBox( width: size.width * 0.01),
                Text('Patrones: ${datosConvert.nPatrones}', style: TextStyle(color: color, fontWeight: FontWeight.bold),),
                SizedBox( width: size.width * 0.01),
              ],
            ),
            SizedBox( height: size.height * 0.01,),
          ],
        ),
      );
  }

  Column _cuadroEntrenamiento(){
    return Column(
      children: [
        CustomInput(
          label: 'Centros Radiales',
          controller: radialCentersController
        )
      ],
    );
  }

  trainingConfig(Size size){
    return const SizedBox();
  }

  _card(Size size, Widget contenido) {
    return Card(
      elevation: 20,
      child: SizedBox(
        child: contenido,
        height: size.height * 0.7,
        width: size.width * 0.4,
      )
    );
  }

  _decorador(){
    return BoxDecoration(
      border: Border.all( color: Colors.brown[800]!),
      borderRadius: BorderRadius.circular( 5 )
    );
  }
}