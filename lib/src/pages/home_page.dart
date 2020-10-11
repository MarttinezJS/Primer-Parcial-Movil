import 'package:flutter/material.dart';
import 'package:parcialmovil1/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {

  static final routeName = 'home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
      ),
      drawer: MenuWidget(),
      body: Center(
        child: Text('Parcial'),
      ),
    );
  }
}