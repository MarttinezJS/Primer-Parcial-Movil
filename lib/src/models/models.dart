import 'dart:convert';

Materia materiaFromJson(String str) => Materia.fromJson(json.decode(str));

String materiaToJson(Materia data) => json.encode(data.toJson());

class Materia {
    Materia({
        this.codigo,
        this.nombre,
        this.nota,
        this.cortes,
    });

    String codigo;
    String nombre;
    double nota;
    List<Corte> cortes;

    factory Materia.fromJson(Map<String, dynamic> json) => Materia(
        codigo: json["codigo"],
        nombre: json["nombre"],
        nota: json["nota"].toDouble(),
        cortes: List<Corte>.from(json["cortes"].map((x) => Corte.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "codigo": codigo,
        "nombre": nombre,
        "nota": nota,
        "cortes": List<dynamic>.from(cortes.map((x) => x.toJson())),
    };
}

class Corte {
    Corte({
        this.numero,
        this.porcentaje,
        this.nota,
        this.total,
        this.actividades,
    });

    int numero;
    double porcentaje;
    double nota;
    double total;
    List<Actividade> actividades;

    factory Corte.fromJson(Map<String, dynamic> json) => Corte(
        numero: json["numero"],
        porcentaje: json["porcentaje"].toDouble(),
        nota: json["nota"].toDouble(),
        total: json["total"].toDouble(),
        actividades: List<Actividade>.from(json["actividades"].map((x) => Actividade.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "numero": numero,
        "porcentaje": porcentaje,
        "nota": nota,
        "total": total,
        "actividades": List<dynamic>.from(actividades.map((x) => x.toJson())),
    };
}

class Actividade {
    Actividade({
        this.nombre,
        this.porcentaje,
        this.nota,
        this.total,
    });

    String nombre;
    double porcentaje;
    double nota;
    double total;

    factory Actividade.fromJson(Map<String, dynamic> json) => Actividade(
        nombre: json["nombre"],
        porcentaje: json["porcentaje"].toDouble(),
        nota: json["nota"].toDouble(),
        total: json["total"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "porcentaje": porcentaje,
        "nota": nota,
        "total": total,
    };
}