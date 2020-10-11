import 'package:flutter/material.dart';
import 'package:parcialmovil1/src/blocs/provider.dart';
import 'package:parcialmovil1/src/widgets/menu_widget.dart';

class RegistroMateria extends StatefulWidget {

  static final routeName = 'registroMaterias';
  @override
  _RegistroMateriaState createState() => _RegistroMateriaState();
}

class _RegistroMateriaState extends State<RegistroMateria> {

  String codigo = '';
  String nombre = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro De Materias'),
      ),
      drawer: MenuWidget(),
      body: Container(
        padding: EdgeInsets.symmetric( horizontal: 10.0, vertical: 30.0),
        child: Column(
          children: [
            Row(
              children: [
                _crearCodigo( context ),
                _crearNombre(),
              ],
            ),
            _crearBoton()
          ],
        )
      ),
    );
  }

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

  Widget _crearBoton() {

    final size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only( top: 15.0 ),
      child: RaisedButton(
        child: Container(
          padding: EdgeInsets.symmetric( horizontal: size.width * 0.35, vertical: 15.0 ),
          child: Text('Agregar'),
        ),
        elevation: 10.0,
        color: Theme.of(context).primaryColor,
        textColor: Colors.white,
        onPressed: (){
          print({codigo});
          print({nombre});
        },
      ),
    );
  }
}