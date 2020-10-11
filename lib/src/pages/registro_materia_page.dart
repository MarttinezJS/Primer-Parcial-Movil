import 'package:flutter/material.dart';
import 'package:parcialmovil1/src/widgets/menu_widget.dart';

class RegistroMateria extends StatefulWidget {

  static final routeName = 'registroMaterias';
  @override
  _RegistroMateriaState createState() => _RegistroMateriaState();
}

class _RegistroMateriaState extends State<RegistroMateria> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro De Materias'),
      ),
      drawer: MenuWidget(),
      body: _crearCampos(),
    );
  }

  Widget _crearCampos() {

    return Container(
      child: Row(
        children: [
          TextField(
            
          ),
        ],
      ),
    );
  }
}