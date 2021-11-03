import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rbr/src/models/red_neuronal_model.dart';
import 'package:rbr/src/providers/red_neuronal_provider.dart';
import 'package:rbr/src/utils/datos_convert.dart';
import 'package:rbr/src/widgets/backgrounds.dart';
import 'package:rbr/src/widgets/custom_bottom.dart';
import 'package:rbr/src/widgets/custom_input.dart';
import 'package:rbr/src/widgets/grafica_error.dart';
import 'package:rbr/src/widgets/lista_pesos.dart';

class Training extends StatefulWidget {
  

  const Training({ Key? key }) : super(key: key);

  @override
  State<Training> createState() => _TrainingState();
}

class _TrainingState extends State<Training> {

  final datosConvert = DatosConvert();
  final radialCentersController = TextEditingController();
  final irmsController = TextEditingController();
  bool datosCargados = false;
  bool redLista = false;
  bool simulacionPermitida = false;

  @override
  Widget build(BuildContext context) {

    final redNeuronalProvider = Provider.of<RedNeuronalProvider>(context);
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _card(size, redConfig(size, primaryColor, redNeuronalProvider)),
              _card(size, trainingConfig(size, redNeuronalProvider))
            ],
          ),
        ),
      ),
    );
  }

  redConfig(Size size, Color color, RedNeuronalProvider redNeuronalProvider){
    return Container(
      margin: EdgeInsets.symmetric( vertical: size.height * 0.02, horizontal: size.width * 0.04),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _cuadroDatos(size, color),
          SizedBox( height: size.height * 0.02,),
          _cuadroEntrenamiento(),
          SizedBox( height: size.height * 0.02,),
          _redInfo(size, redNeuronalProvider.redNeuronal),
          SizedBox( height: size.height * 0.02,),
          CustomButtom(
            onPressed: datosCargados ? () async {
              final data = {
                "num_inputs" : datosConvert.nEntradas,
                "radial_centers" : int.tryParse(radialCentersController.text)
              };
              final res = await redNeuronalProvider.inicializarRed(data);
              if (res == false) {
                
              } else {
                redLista = true;
                setState(() {});
              }
            } : null,
            texto: Text('Configurar', style: TextStyle( color: Theme.of(context).backgroundColor, fontSize: 20, fontWeight: FontWeight.bold)),
            ancho: size.width * 0.02,
            alto: size.height * 0.03
          )
        ],
      ),
    );
  }

  Column _redInfo(Size size, RedNeuronalModel redNeuronal){
    
    return Column(
      children: [
        Text( redLista ? 'Red Inicializada': 'Red No Inicializada', style: TextStyle( color: Theme.of(context).primaryColor, fontSize: 30, fontWeight: FontWeight.bold)),
        SizedBox( height: size.height * 0.03,),
        Row(
          children: [
            Text('Centros Radiales: ${ redNeuronal.radialCenters.length }', style: TextStyle( color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, fontSize: 14),),
            SizedBox( width: size.width * 0.01,),
            Text('Pesos: ${ redNeuronal.outputNode.weights.length }', style: TextStyle( color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, fontSize: 14)),
            SizedBox( width: size.width * 0.01,),
          ],
        ),
        SizedBox( height: size.height * 0.03,),
        Container(
          decoration: _decorador(),
          height: size.height * 0.2,
          width: double.infinity,
          child: ListaPesos(
            pesos: redNeuronal.outputNode.weights,
          ),
        )
      ],
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
              texto: Text( 'Cargar Datos', style: TextStyle(color: Theme.of(context).backgroundColor ), ),
              ancho: size.width * 0.02,
              alto: size.height * 0.025,
              onPressed: () async {
                final resp = await datosConvert.cargarCSV();
                if(resp){
                  datosCargados = true;
                  setState(() {});
                }
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

  trainingConfig(Size size, RedNeuronalProvider redNeuronalProvider){
    return Container(
      margin: EdgeInsets.symmetric( vertical: size.height * 0.02, horizontal: size.width * 0.04),
      child: Column(
        children: [
          SizedBox(height: size.height * 0.02,),
          Text('Configuracion De Entrenamiento', style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 30, fontWeight: FontWeight.bold)),
          SizedBox(height: size.height * 0.02,),
          CustomInput(
            label: 'IRMS',
            controller: irmsController
          ),
          SizedBox(height: size.height * 0.02,),
          SizedBox(
            height: size.height * 0.35,
            child: GraficaError(errorGrafica: redNeuronalProvider.redNeuronal.errors)
          ),
          Text('Error: ${ redNeuronalProvider.redNeuronal.errors.isNotEmpty ? redNeuronalProvider.redNeuronal.errors.last.round() : 0 }', style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 30, fontWeight: FontWeight.bold)),
          SizedBox(height: size.height * 0.02,),
          Row(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButtom(
                onPressed: redLista ? () async {
                  final data = {
                    "inputs": datosConvert.entradas,
                    "outputs": datosConvert.salidas,
                    "tolerance": irmsController.text,
                    "epochs": 1
                  };

                  final resp = await redNeuronalProvider.entrenarRed(data);

                  if(resp == false){
                  } else {
                    simulacionPermitida = double.parse(irmsController.text) >= redNeuronalProvider.redNeuronal.errors.last;
                  }
                } : null,
                texto: Text('Entrenar', style: TextStyle(color: Theme.of(context).backgroundColor, fontWeight: FontWeight.bold, fontSize: 16 ),),
                ancho: size.width * 0.03,
                alto: size.height * 0.02
              ),
              SizedBox(width: size.width * 0.02,),
              CustomButtom(
                onPressed: simulacionPermitida? () {
                    Navigator.pushNamed(context, 'simulacion');
                } : null,
                texto: Text('Simular', style: TextStyle(color: Theme.of(context).backgroundColor, fontWeight: FontWeight.bold, fontSize: 16 ),),
                ancho: size.width * 0.03,
                alto: size.height * 0.02
              ),
            ],
          )
        ],
      ),
    );
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