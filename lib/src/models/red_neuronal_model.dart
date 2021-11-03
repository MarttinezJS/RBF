import 'dart:convert';

RedNeuronalModel redNeuronalModelFromMap(String str) => RedNeuronalModel.fromMap(json.decode(str));

String redNeuronalModelToMap(RedNeuronalModel data) => json.encode(data.toMap());

class RedNeuronalModel {
    RedNeuronalModel({
        required this.numInputs,
        required this.radialCenters,
        required this.outputNode,
        required this.errors,
    });

    int numInputs;
    List<RadialCenter> radialCenters;
    OutputNode outputNode;
    List<double> errors;

    factory RedNeuronalModel.fromMap(Map<String, dynamic> json) => RedNeuronalModel(
        numInputs: json["num_inputs"],
        radialCenters: List<RadialCenter>.from(json["radial_centers"].map((x) => RadialCenter.fromMap(x))),
        outputNode: OutputNode.fromMap(json["output_node"]),
        errors: List<double>.from(json["errors"].map((x) => x.toDouble())),
    );

    Map<String, dynamic> toMap() => {
        "num_inputs": numInputs,
        "radial_centers": List<dynamic>.from(radialCenters.map((x) => x.toMap())),
        "output_node": outputNode.toMap(),
        "errors": List<dynamic>.from(errors.map((x) => x)),
    };
}

class OutputNode {
    OutputNode({
        required this.numInputs,
        required this.weights,
        required this.bias,
    });

    int numInputs;
    List<double> weights;
    double bias;

    factory OutputNode.fromMap(Map<String, dynamic> json) => OutputNode(
        numInputs: json["num_inputs"],
        weights: List<double>.from(json["weights"].map((x) => x.toDouble())),
        bias: json["bias"].toDouble(),
    );

    Map<String, dynamic> toMap() => {
        "num_inputs": numInputs,
        "weights": List<dynamic>.from(weights.map((x) => x)),
        "bias": bias,
    };
}

class RadialCenter {
    RadialCenter({
        required this.numInputs,
        required this.centroids,
    });

    int numInputs;
    List<double> centroids;

    factory RadialCenter.fromMap(Map<String, dynamic> json) => RadialCenter(
        numInputs: json["num_inputs"],
        centroids: List<double>.from(json["centroids"].map((x) => x.toDouble())),
    );

    Map<String, dynamic> toMap() => {
        "num_inputs": numInputs,
        "centroids": List<dynamic>.from(centroids.map((x) => x)),
    };
}
