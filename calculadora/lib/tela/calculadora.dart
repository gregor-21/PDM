import 'package:calculadora/modelos/memory.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../componentes/display.dart';
import '../componentes/keyboard.dart';

class calculadora extends StatefulWidget {
  @override
  State<calculadora> createState() => _calculadoraState();
}

class _calculadoraState extends State<calculadora> {
  final Memory memory = Memory();

    _onPressed(String command){ 
      setState(() {
        memory.applyCommand(command);
      });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);
    return MaterialApp(
      home: Column(
        children: <Widget>[
          Display(memory.value),
          Keyboard(_onPressed),
        ],
        ),
    );
  }
}