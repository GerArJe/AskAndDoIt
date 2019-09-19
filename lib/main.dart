import 'package:ask_and_doit/widgets/button_deeppurple.dart';
import 'package:ask_and_doit/widgets/gradient_back.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.purple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyHomePage();
  }
}

class _MyHomePage extends State<MyHomePage>{

  double screenWith;

  @override
  Widget build(BuildContext context) {

    screenWith = MediaQuery.of(context).size.width;

    // TODO: implement build
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GradientBack(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Flexible(
                child: Container(
                  width: screenWith,
                  child: Text(
                    "ASK AND DO IT",
                    style: TextStyle(
                      fontSize: 37.0,
                      fontFamily: "Lato",
                      color: Colors.white,
                      fontWeight:FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              ButtonDeepPurple(text: "Comenzar"),

              Flexible(
                child: Container(
                  width: screenWith,
                  child: Text(
                    "Para vivir la mejor experiencia realiza el reto y responde la pregunta",
                    style: TextStyle(
                      fontSize: 27.0,
                      fontFamily: "Lato",
                      color: Colors.white,
                      fontWeight:FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          )
        ],
      )
    );
  }

}

