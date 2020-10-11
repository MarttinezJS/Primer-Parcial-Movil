import 'dart:async';

import 'package:parcialmovil1/src/blocs/validators.dart';


class MateriasBloc with Validators { 

  final _codeController = StreamController<String>.broadcast();

  Stream<String>     get codeStream => _codeController.stream.transform( validarRepetidos );
  Function( String ) get changeCode => _codeController.sink.add;

  dispose() {
    _codeController?.close();
  }
}