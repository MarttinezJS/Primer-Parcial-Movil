import 'package:flutter/material.dart';
import 'package:parcialmovil1/src/models/models.dart';

class RegistroNotas extends StatefulWidget {

  static final routeName = 'registroNotas';
  final ValueChanged<List<Corte>> cortes;

  @override
  _RegistroNotasState createState() => _RegistroNotasState();

  const RegistroNotas({Key key, this.cortes}) : super(key: key);
}

class _RegistroNotasState extends State<RegistroNotas> with SingleTickerProviderStateMixin{

  TabController _tabController;
  final corte1 = Corte();
  final corte2 = Corte();
  final corte3 = Corte();


  @override
  void initState() {
    _tabController = TabController(
      length: 4,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TabBar(
              controller: _tabController,
              indicatorColor: Theme.of(context).primaryColor,
              labelColor: Colors.black,
              tabs: [
                Tab(
                  text: 'Primer Corte',
                ),
                Tab(
                  text: 'Segundo Corte',
                ),
                Tab(
                  text: 'Tercer Corte',
                ),
                Tab(
                  text: 'Calcular',
                ),
              ]
            ),
            Container(
              width: double.infinity,
              height: size.height * 0.6,
              child: TabBarView(
                controller: _tabController,
                children: [
                  _corte1(),
                  _corte2(),
                  _corte3(),
                  _calcular()
                ],
              ),
            )
          ],
        ),
        
      )
    );
  }

  Widget _calcular(){

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RaisedButton(
          textColor: Colors.white,
          color: Theme.of(context).primaryColor,
          child: Text('Calcular'),
          onPressed: () {
            final listaTemp = List<Corte>();
            listaTemp.add(corte1);
            listaTemp.add(corte2);
            listaTemp.add(corte3);

            widget.cortes( listaTemp );
          },
        )
      ],
    );
  }

  Widget _corte1() {

    final actividad = Actividad();
    corte1.numero = 1;
    corte1.total = 0;
    corte1.actividades = [];
    
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.only( left: 10.0 ),
              width: 230.0,
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Nombre de la actividad'
                ),
                onChanged: ( value ) {
                  actividad.nombre = value;
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only( left: 10.0 ),
              width: 80.0,
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Nota'
                ),
                onChanged: ( value ) {
                  actividad.nota = double.parse(value);
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only( left: 10.0 ),
              width: 60.0,
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '%'
                ),
                onChanged: ( value ) {
                  actividad.porcentaje = double.parse( value );
                },
              ),
            ),
          ],
        ),
        RaisedButton(
          color: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular( 20.0 )),
          textColor: Colors.white,
          child: Container(
            child: Center(child: Text('Agregar')),
          ),
          onPressed: () {
            actividad.total = actividad.nota * actividad.porcentaje / 100;
            corte1.actividades.add( actividad );
            corte1.total += actividad.total;
          },
        ),
        Container(
          child: ListView(
            children: [
              ListTile(
                // title: ,
              )
            ],
          )
        )
      ],
    );

  }

  Widget _corte2() {

     final actividad = Actividad();
    corte2.numero = 2;
    corte2.total = 0;
    corte2.actividades = [];
    
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.only( left: 10.0 ),
              width: 230.0,
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Nombre de la actividad'
                ),
                onChanged: ( value ) {
                  actividad.nombre = value;
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only( left: 10.0 ),
              width: 80.0,
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Nota'
                ),
                onChanged: ( value ) {
                  actividad.nota = double.parse(value);
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only( left: 10.0 ),
              width: 60.0,
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '%'
                ),
                onChanged: ( value ) {
                  actividad.porcentaje = double.parse( value );
                },
              ),
            ),
          ],
        ),
        RaisedButton(
          color: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular( 20.0 )),
          textColor: Colors.white,
          child: Container(
            child: Center(child: Text('Agregar')),
          ),
          onPressed: () {
            actividad.total = actividad.nota * actividad.porcentaje / 100;
            corte2.actividades.add( actividad );
            corte2.total += actividad.total;
          },
        ),
      ],
    );
  }

  Widget _corte3() {

     final actividad = Actividad();
    corte3.numero = 3;
    corte3.total = 0;
    corte3.actividades = [];
    
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.only( left: 10.0 ),
              width: 230.0,
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Nombre de la actividad'
                ),
                onChanged: ( value ) {
                  actividad.nombre = value;
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only( left: 10.0 ),
              width: 80.0,
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Nota'
                ),
                onChanged: ( value ) {
                  actividad.nota = double.parse(value);
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only( left: 10.0 ),
              width: 60.0,
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '%'
                ),
                onChanged: ( value ) {
                  actividad.porcentaje = double.parse( value );
                },
              ),
            ),
          ],
        ),
        RaisedButton(
          color: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular( 20.0 )),
          textColor: Colors.white,
          child: Container(
            child: Center(child: Text('Agregar')),
          ),
          onPressed: () {
            actividad.total = actividad.nota * actividad.porcentaje / 100;
            corte3.actividades.add( actividad );
            corte3.total += actividad.total;
          },
        ),
      ],
    );
  }


}