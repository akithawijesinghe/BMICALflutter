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
  bool isMaleSelected = false;
  late double bmi = calculateBMI(height: height, weight: weight);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Container(
          //height: 50,
          //width: 50,
          color: Color.fromARGB(255, 255, 255, 255),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Text(
                "BMI Calculator",
                style: kHeading,
              ),
              //const SizedBox(height: 20),
              Row(
                children: [
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isMaleSelected = !isMaleSelected;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Color.fromARGB(255, 0, 0, 0)),
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                          color: (isMaleSelected
                              ? Colors.red
                              : Colors.transparent),
                        ),
                        child: Column(
                          children: const [
                            //const SizedBox(height: 30),
                            Icon(Icons.male, size: 150),
                            Text(
                              "Male",
                              style: subheading,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: (Color.fromARGB(255, 87, 193, 222)),
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      ),
                      child: Column(
                        children: const [
                          Icon(Icons.female, size: 150),
                          Text(
                            "Female",
                            style: subheading,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 170, // Set the width to 100 pixels
                      height: 180,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color.fromARGB(255, 0, 0, 0)),
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            "Height",
                            style: subheading,
                          ),
                          Text("$height", style: hewecolor),
                          Row(
                            children: [
                              const SizedBox(width: 10),
                              FloatingActionButton(
                                backgroundColor:
                                    Color.fromARGB(255, 64, 169, 201),
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
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ),
                              const SizedBox(width: 35),
                              FloatingActionButton(
                                  backgroundColor:
                                      Color.fromARGB(255, 64, 169, 201),
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
                                    color: Colors.white,
                                    size: 40,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 170, // Set the width to 100 pixels
                      height: 180,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            "Weight",
                            style: subheading,
                          ),
                          Text("$weight", style: hewecolor),
                          Row(
                            children: [
                              const SizedBox(width: 10),
                              FloatingActionButton(
                                backgroundColor:
                                    Color.fromARGB(255, 64, 169, 201),
                                onPressed: () {
                                  setState(() {
                                    if (weight > 20) weight--;
                                    bmi = calculateBMI(
                                        height: height, weight: weight);
                                  });
                                },
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ),
                              const SizedBox(width: 35),
                              FloatingActionButton(
                                  backgroundColor:
                                      Color.fromARGB(255, 64, 169, 201),
                                  onPressed: () {
                                    setState(() {
                                      if (weight < 120) weight++;
                                      bmi = calculateBMI(
                                          height: height, weight: weight);
                                    });
                                  },
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 40,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              FloatingActionButton(
                backgroundColor: Color.fromARGB(255, 64, 169, 201),
                onPressed: null,
              ),

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
