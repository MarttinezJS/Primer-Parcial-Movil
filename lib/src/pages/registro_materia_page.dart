import 'package:flutter/material.dart';
import 'package:parcialmovil1/src/blocs/provider.dart';
import 'package:parcialmovil1/src/models/models.dart';
import 'package:parcialmovil1/src/pages/home_page.dart';
import 'package:parcialmovil1/src/pages/registro_notas_page.dart';
import 'package:parcialmovil1/src/providers/db_provider.dart';

class RegistroMateria extends StatefulWidget {

  static final routeName = 'registroMaterias';
  @override
  _RegistroMateriaState createState() => _RegistroMateriaState();
}

class _RegistroMateriaState extends State<RegistroMateria> {

  String codigo = '';
  String nombre = '';
  List<Corte> _cortes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro De Materias'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric( horizontal: 10.0, vertical: 30.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  _crearCodigo( context ),
                  _crearNombre(),
                ],
              ),
              Container(
                height: 558.0,
                child: RegistroNotas(cortes: asignarNota,)
              ),
              _crearBotones()
            ],
          ),
        )
      ),
    );
  }

  asignarNota( List<Corte> cortes ) => _cortes = cortes;

  Widget _crearCodigo( BuildContext context ) {

    final bloc = Provider.of(context);

    return StreamBuilder(
      stream: bloc.codeStream ,
      builder: (BuildContext context, AsyncSnapshot snapshot){

        codigo = snapshot.data;
        return Container(
          width: 120.0,
          child: TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              icon: Icon( Icons.turned_in_not ),
              hintText: 'FS400',
              labelText: 'Codigo',
              errorText: snapshot.error,
            ),
            onChanged: bloc.changeCode,
          ),
        );
        
      },
    );
  }

  Widget _crearNombre() {

    return Container(
      width: 250.0,
      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          icon: Icon( Icons.text_format ),
          hintText: 'Ondas',
          labelText: 'Nombre',
        ),
        onChanged: (value) => nombre = value ,
      ),
    );
  }

  Widget _crearBotones() {

    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            child: RaisedButton(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 35.0),
                child: Text('Cancelar'),
              ),
              elevation: 10.0,
              color: Colors.red,
              textColor: Colors.white,
              onPressed: () => Navigator.pushReplacementNamed(context, HomePage.routeName)
            ),
          ),
          Container(
            child: RaisedButton(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 35.0),
                child: Text('Finalizar'),
              ),
              elevation: 10.0,
              color: Colors.green,
              textColor: Colors.white,
              onPressed: (){

                final materia = _calcularDefinitiva();
                materia.nombre = nombre;
                materia.codigo = codigo;
                DBProvider.db.nuevaMateria(materia);
                Navigator.pushReplacementNamed(context, HomePage.routeName);

              },
            ),
          )
        ],
      ),
    );
  }

  Materia _calcularDefinitiva(){
    final materia = Materia();
    _cortes.forEach((element) {
      if ( element.numero == 1 ) {
        materia.corte1 = element.total * 0.3;
      } else if ( element.numero == 2 ){
        materia.corte2 = element.total * 0.3;
      } else {
        materia.corte3 = element.total * 0.4;
      }
    });
    materia.nota = materia.corte1 + materia.corte2 + materia.corte3;
    return materia;
  }
}