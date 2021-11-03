import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class GraficaError extends StatelessWidget {

  final List<double> errorGrafica;

  const GraficaError({
    Key? key,
    required this.errorGrafica
  }) : super(key: key); 

  @override
  Widget build(BuildContext context) {

    List<double> grafica = [];
    grafica.add(1);
    
    
    errorGrafica.isNotEmpty ? grafica.add(errorGrafica[0]) : null;

    return SfCartesianChart(
      legend: Legend(isVisible: true),
      enableAxisAnimation: true,
      series: <LineSeries>[
        LineSeries<double, double>(
          dataSource: grafica,
          xValueMapper: ( grafica, contador) => contador.toDouble(),
          yValueMapper: ( grafica, _) => grafica,
          isVisibleInLegend: false,
          color: Theme.of(context).primaryColor,
        ),
      ],
    );
  }
}
