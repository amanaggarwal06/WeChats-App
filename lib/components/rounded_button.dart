import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {

  RoundedButton({this.button_name = '', required this.colour, required this.onpressed});

  final Color colour;
  late final Function onpressed;
  late final String button_name;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: (){
            onpressed;},

            minWidth: 200.0,
            height: 42.0,

          child: Text(
            button_name,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}