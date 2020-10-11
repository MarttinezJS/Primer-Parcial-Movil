import 'package:flutter/material.dart';
import 'package:parcialmovil1/src/blocs/provider.dart';

import 'package:parcialmovil1/src/routes/app_routes.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Primer Parcial',
        initialRoute: 'home',
        routes: Rutas.rutas,
        theme: ThemeData(primaryColor: Color.fromRGBO(102, 0, 17, 1)),
      ),
    );
  }
}