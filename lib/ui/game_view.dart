import 'package:ask_and_doit/widgets/button_deeppurple.dart';
import 'package:ask_and_doit/widgets/gradient_back.dart';
import 'package:flutter/material.dart';

class GameView extends StatefulWidget {

  static final nombrePagina = "GameView";

  @override
  _GameViewState createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {

  double screenWith;

  @override
  Widget build(BuildContext context) {

    screenWith = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(
      appBar: AppBar(title: Text("ASK AND DO IT"),),
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
                    "Pregunta",
                    style: TextStyle(
                      fontSize: 37.0,
                      fontFamily: "Lato",
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              Flexible(
                child: Container(
                  width: screenWith,
                  child: Text(
                    "Reto",
                    style: TextStyle(
                      fontSize: 37.0,
                      fontFamily: "Lato",
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              ButtonDeepPurple(
                  text: "Comenzar",
                  onPressed: () => Navigator.pushNamed(context, GameView.nombrePagina)),
            ],
          )
        ],
      ),
    );
  }
}
