import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bmi extends StatefulWidget {
  @override
  _BmiState createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  final TextEditingController _heightController = TextEditingController(); //_var = private var
  final TextEditingController _weightController = TextEditingController(); //_var = private var
  final key = GlobalKey<ScaffoldState>(); //to save the state of Scaffold
  var _result = '';
  var _situation = '';

  _onItemTapped(int index){
    if (index==0){
      _heightController.clear();
      _weightController.clear();
      setState(() {
        _result = '';
        _situation = '';
      });

    } else {
      if (_heightController.text.isEmpty || _weightController.text.isEmpty)
        {
          key.currentState.showSnackBar(SnackBar(
            content: Text('Type height and weight', style: TextStyle(fontSize: 20),),
          ));
        }else{
          try {
            var weight = double.parse(_weightController.text);
            var height = double.parse(_heightController.text);
            var bmi = weight / (height * height);
            //          debugPrint(bmi.toStringAsFixed(2)); //print 2 decimal places
            setState(() {
              _result = 'BMI = ${bmi.toStringAsFixed(2)}';
              //situations:
              if (bmi<17) _situation = 'Very underweight';
              else if (bmi<18.5) _situation = 'Underweight';
              else if (bmi<25) _situation = 'Normal weight';
              else if (bmi<30) _situation = 'Overweight';
              else if (bmi<35) _situation = 'Obesity';
              else if (bmi<40) _situation = 'Severe obesity';
              else _situation = 'Morbid obesity';
            });
          } catch (e) {
            key.currentState.showSnackBar(SnackBar(
            content: Text('Invalid height or weight', style: TextStyle(fontSize: 20),),
          ));

          }
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key, //saves the state of Scaffold in the var 'key'
      appBar: AppBar(
        title: Text('BMI Calculator')
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset("assets/balance.png", width: 100),
          TextField(
            controller: _heightController, //to controll text inputs
            keyboardType: TextInputType.numberWithOptions(decimal: true),
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
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              hintText: 'Weight',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20)
              ),
              icon: Icon(Icons.person)
            ),
          ),
          Text('$_result', style: TextStyle(fontSize: 30)),
          Text('$_situation', style: TextStyle(fontSize: 30)),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.indigo,
        onTap: (value) => _onItemTapped(value),
        items: [
          //clear
          BottomNavigationBarItem(
            icon: Icon(Icons.clear),
            title: Text('Clear', style: TextStyle(color: Colors.white, fontSize: 25))
          ),
          //calculate bmi
          BottomNavigationBarItem(
            icon: Icon(Icons.check),
              title: Text('Calculate', style: TextStyle(color: Colors.white, fontSize: 25),)
          )
        ],
      ),
    );
  }
}

