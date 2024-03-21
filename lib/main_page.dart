import 'package:bmicalculator/constant.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int height = 150;
  int weight = 60;
  late double bmi = calculateBMI(height: height, weight: weight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: const [
                        //const SizedBox(height: 30),
                        Icon(Icons.male, size: 150),
                        Text("Male"),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: const [
                        Icon(Icons.female, size: 150),
                        Text("Female"),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 50),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text(
                          "Height",
                        ),
                        Text("$height", style: kinputLableColor),
                        Row(
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (height > 80) height--;
                                  bmi = calculateBMI(
                                      height: height, weight: weight);
                                });
                                print("height");
                              },
                              child: Icon(
                                Icons.remove,
                                size: 40,
                              ),
                            ),
                            const SizedBox(width: 25),
                            FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    if (height < 200) height++;
                                    bmi = calculateBMI(
                                        height: height, weight: weight);
                                  });
                                  print("height");
                                },
                                child: Icon(
                                  Icons.add,
                                  size: 40,
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text(
                          "Weight",
                        ),
                        Text("$weight", style: kinputLableColor),
                        Row(
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (weight > 20) weight--;
                                  bmi = calculateBMI(
                                      height: height, weight: weight);
                                });
                              },
                              child: Icon(
                                Icons.remove,
                                size: 40,
                              ),
                            ),
                            const SizedBox(width: 25),
                            FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    if (weight < 120) weight++;
                                    bmi = calculateBMI(
                                        height: height, weight: weight);
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                  size: 40,
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              Column(
                children: [
                  const Text("BMI"),
                  Text(
                    "${bmi.toStringAsFixed(2)}",
                    style: kinputLableColor,
                  ),
                  Text(
                    getResult(bmi),
                    style: kinputLable2Color,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void onHeightMinus() {
    print("Height Minus");
  }

  double calculateBMI({required height, required int weight}) {
    return (weight / (height * height)) * 10000;
  }

  String getResult(bmiValue) {
    if (bmiValue >= 25) {
      return "OverWeight";
    } else if (bmiValue >= 18.5) {
      return "Normal";
    } else {
      return "UnderWeight";
    }
  }
}
