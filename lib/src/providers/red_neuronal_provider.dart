import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rbr/global/enviroment.dart';
import 'package:rbr/src/models/red_neuronal_model.dart';

class RedNeuronalProvider extends ChangeNotifier{
  
  RedNeuronalModel _red = RedNeuronalModel(numInputs: 0, radialCenters: [], outputNode: OutputNode(bias: 0, numInputs: 0, weights: []), errors: []);
  
  RedNeuronalModel get redNeuronal => _red;
  set redNeuronal( RedNeuronalModel value){
    _red = value;
    notifyListeners();
  }

  RedNeuronalProvider();

  getRed() async {
    http.Response res;
    try {
      res = await http.get(Uri.parse('${Enviroment.uri}/'));
    } catch (e) {
      res = http.Response(e.toString(), 500);
    }

    return _redNeuronalResponse(res);
  }

  inicializarRed(data) async {

    http.Response res;
    try {
      res = await http.post(Uri.parse('${Enviroment.uri}/init'),
        body: jsonEncode(data),
        headers: {
          'Content-Type': 'application/json'
        }
      );
    } catch (e) {
      res = http.Response(e.toString(), 500);
    }

    return _redNeuronalResponse(res);
  }

  entrenarRed(data) async {

    http.Response res;
    try {
      res = await http.post(Uri.parse('${Enviroment.uri}/fit'),
        body: jsonEncode(data),
        headers: {
          'Content-Type': 'application/json'
        }
      );
    } catch (e) {
      res = http.Response(e.toString(), 500);
    }

    return _redNeuronalResponse(res);
  }

  simular(data) async {

    http.Response res;
    try {
      res = await http.patch(Uri.parse('${Enviroment.uri}/eval'),
        body: jsonEncode(data),
        headers: {
          'Content-Type': 'application/json'
        }
      );
    } catch (e) {
      res = http.Response(e.toString(), 500);
    }

    return res.body;
  }

  _redNeuronalResponse(http.Response res){
    if(res.statusCode == 200) {
      redNeuronal = redNeuronalModelFromMap(res.body);
      return redNeuronal;
    }else{
      return false;
    }
  }
}