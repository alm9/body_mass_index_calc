import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bmi extends StatefulWidget {
  @override
  _BmiState createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  final TextEditingController _heightController = TextEditingController(); //_var = private var
  final TextEditingController _weightController = TextEditingController(); //_var = private var

  _onItemTapped(int index){
    // debugPrint(index.toString());
    if (index==0){
      _heightController.clear();
      _weightController.clear();
    } else {
       debugPrint(_heightController.text);
       debugPrint(_weightController.text);
    }
  }

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

