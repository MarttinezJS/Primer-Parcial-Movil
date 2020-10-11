import 'package:flutter/material.dart';
import 'package:parcialmovil1/src/widgets/menu_widget.dart';

class RegistroNotas extends StatefulWidget {

  static final routeName = 'registroNotas';

  @override
  _RegistroNotasState createState() => _RegistroNotasState();
}

class _RegistroNotasState extends State<RegistroNotas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuWidget(),
      body: Center(
        child: Text('Registrar Notas'),
      ),
    );
  }
}