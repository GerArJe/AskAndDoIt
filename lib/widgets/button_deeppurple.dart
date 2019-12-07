import 'package:flutter/material.dart';

class ButtonDeepPurple extends StatefulWidget{

  final String text;
  final VoidCallback onPressed;

  ButtonDeepPurple({Key key,
    @required this.text,
    @required this.onPressed});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ButtonDeepPurple();
  }

}

class _ButtonDeepPurple extends State<ButtonDeepPurple>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        margin: EdgeInsets.only(
            top: 30.0,
            left: 20.0,
            right: 20.0
        ),
        width: 250,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            gradient: LinearGradient(
                colors: [
                  Colors.deepPurpleAccent,//arriba
                  Colors.deepPurple //abajo
                ],
                begin: FractionalOffset(0.2, 0.0),
                end: FractionalOffset(1.0, 0.6),
                stops: [0.0, 0.6],
                tileMode: TileMode.clamp
            )
        ),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
                fontSize: 18.0,
                fontFamily: "Lato",
                color: Colors.white
            ),
          ),
        ),
      ),
    );
  }

}