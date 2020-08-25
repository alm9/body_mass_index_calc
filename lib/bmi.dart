import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bmi extends StatefulWidget {
  @override
  _BmiState createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  final TextEditingController _heightController = TextEditingController(); //_var = private var
  final TextEditingController _weightController = TextEditingController(); //_var = private var

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator')
      ),
      body: Column(
        children: [
          TextField(
            controller: _heightController, //to controll text inputs
          ),
          TextField(
            controller: _weightController, //to controll text inputs
          )
        ],
      ),
    );
  }
}

