import 'package:bmi/constants/app_constants.dart';
import 'package:bmi/widgets/left_widget.dart';
import 'package:bmi/widgets/right_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => __HomeScreenState();
}

class __HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator',
              style: TextStyle(
                  color: accentHexColor, fontWeight: FontWeight.w300)),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: mainHexColor,
        body: SingleChildScrollView(
            child: Column(children: [
          const SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Container(
              width: 130,
              child: TextField(
                controller: _heightController,
                style: TextStyle(
                  color: accentHexColor,
                  fontWeight: FontWeight.w300,
                  fontSize: 42,
                ),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: 'Height',
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.75),
                        fontWeight: FontWeight.w100,
                        fontSize: 36)),
              ),
            ),
            Container(
              width: 130,
              child: TextField(
                controller: _weightController,
                style: TextStyle(
                  color: accentHexColor,
                  fontWeight: FontWeight.w300,
                  fontSize: 42,
                ),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: 'Weight',
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.75),
                        fontWeight: FontWeight.w100,
                        fontSize: 36)),
              ),
            ),
          ]),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              double _h = double.parse(_heightController.text);
              double _w = double.parse(_weightController.text);
              setState(() {
                _bmiResult = _w / (_h * _h);
                if (_bmiResult > 25) {
                  _textResult = "You're overweight!";
                } else if (_bmiResult >= 18.5 && _bmiResult <= 25) {
                  _textResult = "You have a normal weight!";
                } else {
                  _textResult = "You are underweight";
                }
                
              });
            },
            child: Container(
              child: Text('Calculate',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 22,
                    color: accentHexColor,
                  )),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
              child: Text(_bmiResult.toStringAsFixed(2),
                  style: TextStyle(
                    fontSize: 82,
                    fontWeight: FontWeight.w300,
                    color: accentHexColor,
                  ))),
          const SizedBox(
            height: 50,
          ),
          Visibility(
            visible: _textResult.isNotEmpty,
            child: Container(
                child: Text(_textResult,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w100,
                      color: accentHexColor,
                    ))),
          ),
          const SizedBox(
            height: 50,
          ),
          const LeftBar(
            barWidth: 40,
            colorPal: Colors.amber,
          ),
          const SizedBox(
            height: 30,
          ),
          const LeftBar(
            barWidth: 50,
            colorPal: Colors.amber,
          ),
          const SizedBox(
            height: 20,
          ),
          const LeftBar(
            barWidth: 25,
            colorPal: Colors.amber,
          ),
          const SizedBox(
            height: 30,
          ),
          const RightBar(barWidth: 50, colorPal: Colors.amber),
          const SizedBox(
            height: 20,
          ),
          const RightBar(barWidth: 35, colorPal: Colors.amber),
        ])));
  }
}
