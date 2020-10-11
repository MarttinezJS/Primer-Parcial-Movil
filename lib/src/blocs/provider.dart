import 'package:flutter/material.dart';
import 'package:parcialmovil1/src/blocs/materias_bloc.dart';

class Provider extends InheritedWidget {

  final materiasBloc = MateriasBloc();
  Provider({Key key, Widget child}) : super(key: key, child: child);

  static MateriasBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<Provider>()).materiasBloc;
  }

  @override
  bool updateShouldNotify(Provider oldWidget) {
    return true;
  }
}