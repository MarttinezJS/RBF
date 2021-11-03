import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rbr/src/providers/red_neuronal_provider.dart';
import 'package:rbr/src/utils/datos_convert.dart';
import 'package:rbr/src/widgets/custom_bottom.dart';

class SimulacionPage extends StatefulWidget {

  const SimulacionPage({Key? key}) : super(key: key);

  @override
  State<SimulacionPage> createState() => _SimulacionPageState();
}

class _SimulacionPageState extends State<SimulacionPage> {

  final datosConvert = DatosConvert();
  @override
  Widget build(BuildContext context) {

    final redNeuronalProvider = Provider.of<RedNeuronalProvider>(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Simulacion'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.01,),
            CustomButtom(
              onPressed: datosConvert.cargarCSV,
              texto: Text( 'Cargar Etradas', style: TextStyle( color: Theme.of(context).backgroundColor ), ),
              ancho: size.width * 0.02,
              alto: size.height * 0.02
            )
          ],
        ),
     ),
   );
  }
}