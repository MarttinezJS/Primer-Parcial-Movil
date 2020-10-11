import 'package:flutter/material.dart';
import 'package:parcialmovil1/src/pages/home_page.dart';
import 'package:parcialmovil1/src/pages/registro_materia_page.dart';
import 'package:parcialmovil1/src/pages/registro_notas_page.dart';

class Rutas {

  static final rutas = <String, Widget Function(BuildContext)>{

    RegistroMateria.routeName : ( c ) => RegistroMateria(),
    RegistroNotas.routeName   : ( c ) => RegistroNotas(),
    HomePage.routeName        : ( c ) => HomePage(),

  };
}