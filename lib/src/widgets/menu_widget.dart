import 'package:flutter/material.dart';
import 'package:parcialmovil1/src/pages/registro_materia_page.dart';
import 'package:parcialmovil1/src/pages/registro_notas_page.dart';

class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          _crearCabecera(),
          ListTile(
            leading: Icon( Icons.add_circle_outline ),
            title: Text('Nueva Materia'),
            onTap: () => Navigator.pushReplacementNamed(context, RegistroMateria.routeName ),
          ),
          ListTile(
            leading: Icon( Icons.format_list_numbered ),
            title: Text('Añadir Notas'),
            onTap: () => Navigator.pushReplacementNamed(context, RegistroNotas.routeName),
          ),
        ],
      ),
    );
  }

  Widget _crearCabecera() {

    return Container(
      padding: EdgeInsets.zero,
      width: double.infinity,
      height: 150,
      color: Color.fromRGBO(102, 0, 17, 1),
    );
  }
}