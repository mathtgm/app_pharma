import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharma_app/views/PageCadastro.dart';
import 'package:pharma_app/views/PageListaFarmacias.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PharmApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'PharmApp'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 150,
                    height: 150,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromARGB(255, 49, 175, 180),
                          Color.fromARGB(255, 67, 241, 247)
                        ],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    ),
                    child: Text(
                      "P",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      textScaleFactor: 8,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text(
                    "PharmApp",
                    style: TextStyle(
                        color: Color.fromARGB(255, 49, 175, 180),
                        fontWeight: FontWeight.bold),
                    textScaleFactor: 3,
                    textAlign: TextAlign.center,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Color.fromARGB(255, 49, 175, 180),
                      ),
                      labelText: "E-mail",
                      labelStyle: TextStyle(color: Colors.blueGrey),
                      focusColor: Color.fromARGB(255, 49, 175, 180),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 49, 175, 180),
                        ),
                      ),
                    ),
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock_outlined,
                        color: Color.fromARGB(255, 49, 175, 180),
                      ),
                      labelText: "Senha",
                      labelStyle: TextStyle(color: Colors.blueGrey),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 49, 175, 180),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 50, bottom: 10),
                    child: Container(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => listaFarmacia()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            shadowColor: Colors.transparent,
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: Ink(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color.fromARGB(255, 49, 175, 180),
                                Color.fromARGB(255, 67, 241, 247)
                              ]),
                              borderRadius: BorderRadius.circular(10)),
                          child: Container(
                            width: 300,
                            height: 100,
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Entrar',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Icon(
                                    Icons.play_arrow_rounded,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.only(left: 10, right: 10),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 300,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => pageCadastro()),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          side: BorderSide(
                            width: 1.0,
                            color: Color.fromARGB(255, 49, 175, 180),
                          )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Cadastrar',
                            style: TextStyle(
                                color: Color.fromARGB(255, 49, 175, 180),
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Icon(
                            Icons.article_outlined,
                            color: Color.fromARGB(255, 49, 175, 180),
                            size: 30,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
