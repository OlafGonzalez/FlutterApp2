

import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selected = 0;
  int _selected2 = 0;
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = new GlobalKey<FormState>();

  String ReturnValorMascota(int valor) {
    switch (valor) {
      case 1:
        return "gato";
        break;
      case 2:
        return "perro";
        break;
      default:
    }
  }
  String ReturnRutaImagenMascota(int valor) {
    switch (valor) {
      case 1:
        return "assets/cat.png";
        break;
      case 2:
        return "assets/dog.png";
        break;
      default:
    }
  }
  String ReturnRutaImagenGenero(int valor) {
    switch (valor) {
      case 1:
        return "assets/woman.png";
        break;
      case 2:
        return "assets/user.png";
        break;
      default:
    }
  }

  String ReturnAnos(String value){
    if (value == "1") {
      return "año";
    } else {
      return "años";
    }
  }

  String ReturnValorGenero(int valor) {
    switch (valor) {
      case 1:
        return "Dueña";
        break;
      case 2:
        return "Dueño";
        break;
      default:
    }
  }

  void CambioDEstado(int value) {
    setState(() {
      _selected = value;
    });
  }

  void CambioDEstado2(int value) {
    setState(() {
      _selected2 = value;
    });
  }

  String nombre;
  String apellidos;
  String edad;

  String nombrePet;
  String edadPet;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: scaffoldKey,
        body: Container(
          decoration: new BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                Color(0xff264434),
                Color(0xff3a8057),
                Color(0xff3a8057),
                Color(0xff5ec465),
                Color(0xff5ec465),
                Color(0xff9ed48f),
                Color(0xff9ed48f),
                Color(0xffc3f8b4),
                Color(0xffc3f8b4)
              ],
                  stops: [
                .1,
                .1,
                .3,
                .3,
                .5,
                .5,
                .7,
                .7,
                .9
              ],
                  begin: FractionalOffset.topLeft,
                  end: FractionalOffset.centerRight)),
          child: Center(
            child: Container(
              width: 500,
              height: 900,
              padding: EdgeInsets.only(top: 220),
              child: Container(
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45),
                      topRight: Radius.circular(45),
                    )),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Por favor ingrese un nombre";
                            }
                          },
                          onSaved: (value) => nombre = value,
                          decoration: InputDecoration(
                            hintText: "Nombre",
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                          )),
                      TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Por favor ingrese sus apellidos";
                            }
                          },
                          onSaved: (value) => apellidos = value,
                          decoration: InputDecoration(
                            hintText: "Apellidos",
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                          )),
                      TextFormField(
                          validator: (value) {
                            int numeroEdad = int.parse(value);
                            if (value.isEmpty || numeroEdad <= 0) {
                              return "Edad invalida o incorrecta";
                            }
                          },
                         onSaved: (value) => edad = value,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Edad",
                            prefixIcon: Icon(Icons.face),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                          )),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              "Soy:",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            Text("Hombre",
                                style: TextStyle(
                                  fontSize: 20,
                                )),
                            new Radio(
                                value: 2,
                                groupValue: _selected2,
                                onChanged: (int value) {
                                  CambioDEstado2(value);
                                }),
                            Text("Mujer",
                                style: TextStyle(
                                  fontSize: 20,
                                )),
                            new Radio(
                                value: 1,
                                groupValue: _selected2,
                                onChanged: (int value) {
                                  CambioDEstado2(value);
                                }),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              "Tengo:",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            Text("Perro",
                                style: TextStyle(
                                  fontSize: 20,
                                )),
                            new Radio(
                                value: 2,
                                groupValue: _selected,
                                onChanged: (int value) {
                                  CambioDEstado(value);
                                }),
                            Text("Gato",
                                style: TextStyle(
                                  fontSize: 20,
                                )),
                            new Radio(
                                value: 1,
                                groupValue: _selected,
                                onChanged: (int value) {
                                  CambioDEstado(value);
                                }),
                          ],
                        ),
                      ),
                      TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Por favor ingrese un nombre";
                            }
                          },
                          onSaved: (value) => nombrePet = value,
                          decoration: InputDecoration(
                            hintText: "Nombre de mi mascota",
                            prefixIcon: Icon(Icons.pets),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                          )),
                      TextFormField(
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            int numeroEdad = int.parse(value);
                            if (value.isEmpty || numeroEdad <= 0) {
                              return "Edad invalida o incorrecta";
                            }
                          },
                          onSaved: (value) => edadPet = value,
                          decoration: InputDecoration(
                            hintText: "Edad de mi mascota",
                            prefixIcon: Icon(Icons.pets),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                          )),
                      StreamBuilder<Object>(
                          stream: null,
                          builder: (context, snapshot) {
                            return RaisedButton(
                              padding: EdgeInsets.only(
                                  left: 50, right: 50, top: 10, bottom: 10),
                              color: Color(0xff264434),
                              shape: StadiumBorder(),
                              child: Text(
                                "Registrar",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23,
                                    letterSpacing: 2),
                              ),
                              onPressed: () {
                                final form = _formKey.currentState;
                                form.save();
                                String tengo;
                                String genero;

                                 if (_formKey.currentState.validate()) {

                                Navigator.push(
                                  context,
                                  MaterialPageRoute<void>(
                                      
                                      builder: (context) => ViewMascotas(
                                            nombre: nombre,
                                            apellidos: apellidos,
                                            edad: edad,
                                            tengo: ReturnValorMascota(_selected),
                                            nombrePet: nombrePet,
                                            edadPet: edadPet,
                                            genero: ReturnValorGenero(_selected2),
                                            rutaPet: ReturnRutaImagenMascota(_selected),
                                            rutaUser: ReturnRutaImagenGenero(_selected2),
                                            anos: ReturnAnos(edadPet),
                                          )
                                          ),
                                );
                                 }
                              },
                            );
                          })
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AnimacionPageRoute extends PageRouteBuilder{
  final Widget child;
  final Builder builder;

  AnimacionPageRoute(this.child, this.builder) : super(
    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation){
      return child;

    },
    transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child){

      return child;
    });
  
}

class CamposText extends StatelessWidget {
  final String texto; 
  final Icon icono;
  const CamposText({
    Key key, this.texto, this.icono,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: (value) {
          int numeroEdad = int.parse(value);
          if (value.isEmpty || numeroEdad <= 0) {
            return "No valido";
          }
        },
       
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: this.texto,
          prefixIcon: this.icono,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15)),
        ));
  }
}

class Parametros {
  final String nombre;
  final String apellidos;
  final int edad;
  final int tengo;
  final String nombrePet;
  final int edadPet;

  Parametros(this.nombre, this.apellidos, this.edad, this.tengo, this.nombrePet,
      this.edadPet);
}

class ViewMascotas extends StatelessWidget {
  final String nombre;
  final String apellidos;
  final String edad;
  final String tengo;
  final String genero;
  final String nombrePet;
  final String edadPet;
  final String rutaUser;
  final String rutaPet;
  final String anos;

  const ViewMascotas(
      {Key key,
      this.nombre,
      this.apellidos,
      this.edad,
      this.tengo,
      this.nombrePet,
      this.edadPet,
      this.genero,
      this.rutaUser, 
      this.rutaPet, this.anos})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: new BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                Color(0xff264434),
                Color(0xff3a8057),
                Color(0xff3a8057),
                Color(0xff5ec465),
                Color(0xff5ec465),
                Color(0xff9ed48f),
                Color(0xff9ed48f),
                Color(0xffc3f8b4),
                Color(0xffc3f8b4)
              ],
                  stops: [
                .1,
                .3,
                .3,
                .4,
                .5,
                .7,
                .7,
                .8,
                .9
              ],
                  begin: FractionalOffset.bottomCenter,
                  end: FractionalOffset.topCenter)),
          child: Container(
            width: 500,
            height: 900,
            padding: EdgeInsets.only(top: 30),
            child: Column(
              children: <Widget>[
                //Imagen
                Container(
                  padding: EdgeInsets.all(14),
                  child: Image.asset(
                    'assets/icono_perro_gato.png',
                    scale: 9,
                  ),
                ),
                //linea Verde
                Container(
                  width: 700,
                  height: 7,
                  color: Color(0xff264434),
                ),
                //Letras Bienvenido
                Container(
                  width: 250,
                  height: 90,
                  padding: EdgeInsets.all(10),
                  child: Center(
                      child: Text(
                    "Bienvenidos",
                    style: TextStyle(
                        fontSize: 40,
                        color: Color(0xff264434),
                        letterSpacing: 3),
                  )),
                ),
                //Card Persona
                Container(
                  width: 390,
                  height: 190,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Color(0xff264434), width: 2)),
                  child: Row(
                    children: <Widget>[
                      Image.asset(rutaUser),
                      Column(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(nombre,style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic),),
                              Text(" " + this.apellidos,style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic),)
                            ],
                          ),
                          Text("$edad años de edad",style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic),),
                          Container(
                            padding: EdgeInsets.only(top:10),
                          ),
                          Text("$genero de un $tengo",style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic),),
                          Text("de $edadPet $anos llamado:",style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic),)
                        ],
                      )
                    ],
                  ),
                ),
                //Card mascota
                Container(
                  width: 200,
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Color(0xff264434), width: 2)),
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                       rutaPet,
                        scale: 1.9,
                      ),
                      Text(nombrePet,style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic),)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
