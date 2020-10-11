
import 'dart:convert';

Materia materiaFromJson(String str) => Materia.fromJson(json.decode(str));

String materiaToJson(Materia data) => json.encode(data.toJson());

class Materia {
    Materia({
        this.codigo,
        this.nombre,
        this.nota = 0.0,
        this.corte1,
        this.corte2,
        this.corte3,
    });

    String codigo;
    String nombre;
    double nota = 0.0;
    double corte1;
    double corte2;
    double corte3;

    factory Materia.fromJson(Map<String, dynamic> json) => Materia(
        codigo: json["codigo"],
        nombre: json["nombre"],
        nota: json["nota"].toDouble(),
        corte1: json["corte1"].toDouble(),
        corte2: json["corte2"].toDouble(),
        corte3: json["corte3"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "codigo": codigo,
        "nombre": nombre,
        "nota": nota,
        "corte1": corte1,
        "corte2": corte2,
        "corte3": corte3,
    };
}


Corte corteFromJson(String str) => Corte.fromJson(json.decode(str));

String corteToJson(Corte data) => json.encode(data.toJson());

class Corte {
    Corte({
        this.total = 0.0,
        this.actividades,
        this.numero
    });

    double total = 0.0;
    int numero;
    List<Actividad> actividades;

    factory Corte.fromJson(Map<String, dynamic> json) => Corte(
        total: json["total"].toDouble(),
        numero: json["numero"].toDouble,
        actividades: List<Actividad>.from(json["actividades"].map((x) => Actividad.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "total": total,
        "numero": numero,
        "actividades": List<dynamic>.from(actividades.map((x) => x.toJson())),
    };
}

class Actividad {
    Actividad({
        this.nombre,
        this.porcentaje,
        this.nota = 0.0,
        this.total = 0.0
    });

    String nombre;
    double porcentaje;
    double nota = 0.0;
    double total = 0.0;

    factory Actividad.fromJson(Map<String, dynamic> json) => Actividad(
        nombre: json["nombre"],
        porcentaje: json["porcentaje"].toDouble(),
        nota: json["nota"].toDouble(),
        total: json["total"].toDouble()
    );

    Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "porcentaje": porcentaje,
        "nota": nota,
        "total": total,
    };
}

