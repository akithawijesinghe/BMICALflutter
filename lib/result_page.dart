import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final double bmi;
  final bool isMaleSelected;

  const ResultPage(
      {required this.bmi, required this.isMaleSelected, super.key});

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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        leading: IconButton(
          icon: const Icon(Icons.home, size: 30),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Image.asset(
              isMaleSelected
                  ? 'assets/male_image9.jpg'
                  : 'assets/female_image9.jpg',
              width: 300,
              height: 300,
            ),
            const SizedBox(height: 20),
            const Text(
              'Your BMI is:',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5.0),
            Text(
              bmi.toStringAsFixed(2),
              style: const TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 35, 13, 108),
              ),
            ),
            const SizedBox(height: 5.0),
            Text(
              bmiStatus,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: bmiStatusColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
