import 'package:flutter/material.dart';
import 'package:flutterbmi/constant.dart';
import 'package:flutterbmi/result_page.dart';

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
  bool isCalculateselect = false;
  late double bmi = calculateBMI(height: height, weight: weight);

  void calculateBMIAndNavigate() {
    setState(() {
      bmi = calculateBMI(height: height, weight: weight);
    });
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ResultPage(bmi: bmi, isMaleSelected: isMaleSelected),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Color.fromARGB(255, 255, 255, 255),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius:
                      BorderRadius.circular(15.0), // Add border radius here
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "BMI Calculator",
                      style: kHeading,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
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
                            width: isMaleSelected ? 3.5 : 1.5,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                          color: (isMaleSelected
                              ? Color.fromARGB(255, 87, 193,
                                  222) //color: (Color.fromARGB(255, 87, 193, 222)),
                              : Colors.transparent),
                        ),
                        child: Column(
                          children: [
                            //const SizedBox(height: 30),
                            //Icon(Icons.male, size: 150),
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(23.0),
                                topRight: Radius.circular(23.0),
                              ),
                              child: Image.asset(
                                //sithija6371
                                'assets/male_image2.jpg', // Add the path to the male image asset
                                width: 150,
                                height: 150,
                              ),
                            ),
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
                            width: isFemaleSelected ? 3.5 : 1.5,
                          ),
                          //color: (Color.fromARGB(255, 87, 193, 222)),
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),

                          color: (isFemaleSelected
                              ? Color.fromARGB(255, 182, 113, 125) // Pink color
                              : Colors.transparent),
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(23.0),
                                topRight: Radius.circular(23.0),
                              ),
                              child: Image.asset(
                                'assets/female_image6.jpg',
                                width: 150,
                                height: 150,
                              ),
                            ),
                            //Icon(Icons.female, size: 150),
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
              const SizedBox(height: 40),
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
                            style: subheadinghw,
                          ),
                          Text("$height", style: hewecolor),
                          Text(
                            " cm",
                            style: subheadinghwj, // Style for the unit "cm"
                          ),
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
                                shape: CircleBorder(),
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
                                ),
                                shape: CircleBorder(),
                              ),
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
                          Text(
                            "Weight",
                            style: subheadinghw,
                          ),
                          Text(
                            " cm",
                            style: subheadinghwj, // Style for the unit "cm"
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
                                shape: CircleBorder(),
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
                                ),
                                shape: CircleBorder(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: calculateBMIAndNavigate,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 255, 255, 255),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: BorderSide(color: Colors.black, width: 2.0),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                ),
                child: Text(
                  'Calculate BMI',
                  style: TextStyle(
                    color: Color.fromARGB(255, 35, 13, 108),
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 5),
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
}
