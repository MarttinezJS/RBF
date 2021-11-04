import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rbr/src/providers/red_neuronal_provider.dart';
import 'package:rbr/src/utils/datos_convert.dart';
import 'package:rbr/src/widgets/backgrounds.dart';
import 'package:rbr/src/widgets/custom_bottom.dart';

class SimulacionPage extends StatefulWidget {

  const SimulacionPage({Key? key}) : super(key: key);

  @override
  State<SimulacionPage> createState() => _SimulacionPageState();
}

class _SimulacionPageState extends State<SimulacionPage> {

  final datosConvert = DatosConvert();
  String salidaRed = '';
  bool datosCargados = false;
  List<String> patron = [];
  String salidaDeseada = '';

  @override
  Widget build(BuildContext context) {

    final redNeuronalProvider = Provider.of<RedNeuronalProvider>(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Simulacion'),
        shape: const RoundedRectangleBorder(
          borderRadius:  BorderRadius.only( bottomLeft: Radius.elliptical(60, 20))
        ),
      ),
      body: BackgroundSimulacion(
        color: Theme.of(context).primaryColor,
        child: Center(
        child: Card(
          elevation: 20,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: size.height * 0.03,),
              CustomButtom(
                onPressed: () async {
                  await datosConvert.cargarCSV();
                  setState(() {});
                },
                texto: Text( 'Cargar Patrón', style: TextStyle( color: Theme.of(context).backgroundColor ), ),
                ancho: size.width * 0.02,
                alto: size.height * 0.02
              ),
              SizedBox(height: size.height * 0.03,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: size.width * 0.02,),
                  Column(
                    children: [
                      Text('Patrónes', style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 18, fontWeight: FontWeight.bold),),
                      SizedBox(height: size.height * 0.03,),
                      datosConvert.entradas.isNotEmpty ? SizedBox(
                        width: size.width * 0.3,
                        height: size.height * 0.3,
                        child: ListView.builder(
                          itemCount: datosConvert.entradas.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              onTap: (){
                                patron = datosConvert.entradas[index];
                                salidaDeseada = datosConvert.salidas[index];
                                datosCargados = true;
                                setState(() {});
                              },
                              title: Text( datosConvert.entradas[index].toString()),
                            );
                          },
                        ),
                      ) : Container(),
                    ],
                  ),
                  SizedBox(width: size.width * 0.02,),
                  Column(
                    children: [
                      Text('Salida Deseada', style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox( height: size.height * 0.02, ),
                      Text( salidaDeseada, style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 14, fontWeight: FontWeight.bold)),
                      SizedBox( height: size.height * 0.02, ),
                    ],
                  ),
                  SizedBox(width: size.width * 0.02,),
                  Column(
                    children: [
                      Text('Salida de la red', style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(width: size.width * 0.02,),
                      Text( salidaRed, style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 14, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(width: size.width * 0.02,),
                ],
              ),
              CustomButtom(
                onPressed: datosCargados ? () async {
                  final data = {
                    "inputs" : patron
                  };
                  final resp = await redNeuronalProvider.simular(data);

                  if ( resp == false) {
                    
                  } else {
                    salidaRed = resp;
                  }
                  setState(() {});
                } : null,
                texto: Text('Simular', style: TextStyle(color: Theme.of(context).backgroundColor, fontSize: 18, fontWeight: FontWeight.bold)),
                ancho: size.width * 0.03,
                alto: size.height * 0.03
              ),
              SizedBox(height: size.height * 0.02,),
            ],
          ),
        ),
      ),
      ),
   );
  }
}