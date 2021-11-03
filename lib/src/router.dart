import 'package:flutter/material.dart';
import 'package:rbr/src/pages/sumilacion.dart';
import 'package:rbr/src/pages/training.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  'training' : ( _ ) => const Training(),
  'simulacion' : ( _ ) => const SimulacionPage()
};