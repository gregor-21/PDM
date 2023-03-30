import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  static const DARK = Color.fromRGBO(82, 82, 82, 1);
  static const DEFAULT = Color.fromARGB(239, 58, 58, 53);
  static const OPERATION = Color.fromARGB(230, 33, 17, 252);
  static const AC = Color.fromRGBO(245, 74, 6, 0.62);

  final String text;
  final bool big_button;
  final Color color;
  final void Function(String) cb;

  Button({
    required this.text,
    this.big_button=false,
    this.color = DEFAULT,
    required this.cb,
  });
   Button.big_button({
    required this.text,
    this.big_button=true,
    this.color = DEFAULT,
    required this.cb,
  });
   Button.operation({
    required this.text,
    this.big_button=false,
    this.color = OPERATION,
    required this.cb,
  });
  Button.ac({
    required this.text,
    this.big_button=true,
    this.color = AC,
    required this.cb,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: big_button? 2 : 1,
      child: ElevatedButton(
        style:ElevatedButton.styleFrom(
          primary : color
        ),
        child: Text(text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 32,
          fontWeight: FontWeight.w200,
        ),),
      onPressed:()=>cb(text),
      )
    );
  }
}