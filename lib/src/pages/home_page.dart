import 'package:flutter/material.dart';
import 'package:parcialmovil1/src/models/models.dart';
import 'package:parcialmovil1/src/pages/registro_materia_page.dart';
import 'package:parcialmovil1/src/providers/db_provider.dart';

class HomePage extends StatefulWidget {

  static final routeName = 'home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
        actions: [
          Row(
            children: [
              RaisedButton(
                onPressed: () {
                  DBProvider.db.borrarTodos();
                  setState(() {
                    
                  });
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular( 100.0 )
                ),
                child: Icon( Icons.delete , color: Theme.of(context).primaryColor, ),
              )
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, RegistroMateria.routeName),
        child: Icon( Icons.add_circle_outline ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: _crearVista()
    );
  }

  Widget _crearVista() {

    return FutureBuilder<List<Materia>>(
      future: DBProvider.db.getMaterias(),
      builder: (BuildContext context, AsyncSnapshot<List<Materia>> snapshot) {
        
        if ( snapshot.data?.length == 0) {
          return Center(child: Text('No hay informacion!!!'),);
        }
        final materias = snapshot.data;
 
        return !snapshot.hasData ? Center( child: CircularProgressIndicator(), ) :
        ListView.builder(
          itemCount: materias.length,
          itemBuilder: (BuildContext context, int index) {
            final size = MediaQuery.of(context).size;
            return Row(
              children: [
                Container(
                  width: size.width * 0.5 ,
                  child: ListTile(
                    leading: Text( materias[index].codigo ),
                    title: Text( materias[index].nombre ),
                  ),
                ),
                Container(
                  width: size.width * 0.1,
                  child: Text( materias[index].corte1.toString().substring(0,3) ),
                ),
                Container(
                  width: size.width * 0.1,
                  child: Text( materias[index].corte2.toString().substring(0,3) ),
                ),
                Container(
                  width: size.width * 0.1,
                  child: Text( materias[index].corte3.toString().substring(0,3) ),
                ),
                Container(
                  width: size.width * 0.1,
                  child: Text( materias[index].nota.toString().substring(0,3) ),
                ),
              ],
            );
         },
        );

      },
    );
  }
}