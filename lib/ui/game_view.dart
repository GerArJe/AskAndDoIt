import 'dart:ffi';

import 'package:ask_and_doit/model/Question.dart';
import 'package:ask_and_doit/repository/cloud_firestore_api.dart';
import 'package:ask_and_doit/widgets/button_deeppurple.dart';
import 'package:ask_and_doit/widgets/gradient_back.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class GameView extends StatefulWidget {
  static final nombrePagina = "GameView";

  @override
  _GameViewState createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  double screenWith;
  final Firestore _db = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    screenWith = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("ASK AND DO IT"),
      ),
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
                    margin: EdgeInsets.only(
                        top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
                    child: randomQuestion()),
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
                  onPressed: () =>
                      Navigator.popAndPushNamed(context, GameView.nombrePagina)),

            ],
          )
        ],
      ),
    );
  }

  StreamBuilder randomQuestion() {
    return StreamBuilder<QuerySnapshot>(
      stream: _db.collection('questions').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return CircularProgressIndicator();
          case ConnectionState.done:
            return textRandomQuestion(snapshot);
          case ConnectionState.active:
            return textRandomQuestion(snapshot);
          case ConnectionState.none:
            return CircularProgressIndicator();
          default:
            return textRandomQuestion(snapshot);
        }
      },
    );
  }

  Text textRandomQuestion(AsyncSnapshot<QuerySnapshot> snapshot){
    return Text(
      "Pregunta: ${CloudFirestoreAPI().getRandomQuestion(snapshot.data.documents)}",
      style: TextStyle(
        fontSize: 37.0,
        fontFamily: "Lato",
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }
}
