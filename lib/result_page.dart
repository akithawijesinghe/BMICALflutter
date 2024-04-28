// result_page.dart
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final double bmi;
  //final bool isMaleSelected;

  ResultPage({required this.bmi});

  @override
  Widget build(BuildContext context) {
    String bmiStatus;
    Color bmiStatusColor;

    if (bmi >= 25) {
      bmiStatus = "Overweight";
      bmiStatusColor = Colors.red;
    } else if (bmi >= 18.5) {
      bmiStatus = "Normal";
      bmiStatusColor = Colors.green;
    } else {
      bmiStatus = "Underweight";
      bmiStatusColor = Colors.orange;
    }

    //const SizedBox(height: 100);
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI Result'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Image.asset(
                'assets/female_image.png', // Add the path to the male image asset
                width: 300,
                height: 300,
              ),
              SizedBox(height: 20),
              //SizedBox(height: 150),
              Text(
                'Your BMI is:',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                bmi.toStringAsFixed(2),
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                bmiStatus,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: bmiStatusColor,
                ),
              ),
            ],
          ),
        ));
  }
}
