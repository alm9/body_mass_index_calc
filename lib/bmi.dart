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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset("assets/balance.png", width: 100),
          TextField(
            controller: _heightController, //to controll text inputs
            decoration: InputDecoration(
              hintText: 'Height',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20)
              ),
              icon: Icon(Icons.accessibility)
            ),
          ),
          TextField(
            controller: _weightController,
            decoration: InputDecoration(
              hintText: 'Weight',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20)
              ),
              icon: Icon(Icons.person)
            ),//to controll text inputs
          )
        ],
      ),
    );
  }
}

