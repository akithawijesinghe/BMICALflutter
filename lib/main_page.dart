import 'package:flutter/material.dart';
import 'package:flutterbmi/constant.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int height = 150;
  int weight = 60;
  bool isMaleSelected = false;
  bool isFemaleSelected = false;
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
                        isMaleSelected = true;
                        isFemaleSelected = false;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: isFemaleSelected
                                ? Color.fromARGB(255, 5, 5, 87)
                                : Colors.black,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                          color: (isMaleSelected
                              ? Color.fromARGB(255, 87, 193,
                                  222) //color: (Color.fromARGB(255, 87, 193, 222)),
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
                  InkWell(
                    onTap: () {
                      setState(() {
                        isFemaleSelected = true;
                        isMaleSelected = false;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: isFemaleSelected
                                ? Color.fromARGB(255, 103, 46, 55)
                                : Colors.black,
                          ),
                          //color: (Color.fromARGB(255, 87, 193, 222)),
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),

                          color: (isFemaleSelected
                              ? Color.fromARGB(255, 182, 113, 125) // Pink color
                              : Colors.transparent),
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
                                    Color.fromARGB(255, 35, 13, 108),
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
                                      Color.fromARGB(255, 35, 13, 108),
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
                                    Color.fromARGB(255, 35, 13, 108),
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
                                      Color.fromARGB(255, 35, 13, 108),
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

              ElevatedButton(
                onPressed: () {
                  // Add your button functionality here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 52, 79, 202),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                ),
                child: Text(
                  'Calculate BMI',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(height: 5),

              Column(
                children: [
                  const Text(
                    "Your BMI is ",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${bmi.toStringAsFixed(2)}",
                    style: kinputLableColor,
                  ),
                  getResult(bmi),
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

  Widget getResult(double bmiValue) {
    String resultText;
    Color resultColor;

    if (bmiValue >= 25) {
      resultText = "OverWeight";
      resultColor = const Color.fromARGB(255, 181, 41, 31);
    } else if (bmiValue >= 18.5) {
      resultText = "Normal";
      resultColor = const Color.fromARGB(255, 17, 97, 20);
    } else {
      resultText = "UnderWeight";
      resultColor = const Color.fromARGB(255, 243, 149, 8);
    }

    return Text(
      resultText,
      style: TextStyle(
        color: resultColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
