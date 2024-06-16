import 'package:flutter/material.dart';
import 'result_page.dart';
import 'constant.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int height = 150;
  int weight = 50;
  bool isMaleSelected = false;
  bool isFemaleSelected = false;
  late double bmi;

  @override
  void initState() {
    super.initState();
    bmi = calculateBMI(height: height, weight: weight);
  }

  void calculateBMIAndNavigate() {
    setState(() {
      bmi = calculateBMI(height: height, weight: weight);
    });

    
    print("BMI calculated: $bmi");
    print("Navigating to ResultPage...");

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ResultPage(bmi: bmi, isMaleSelected: isMaleSelected),
      ),
    ).catchError((error) {
      
      print("Navigation error: $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: const Color.fromARGB(255, 255, 255, 255),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: const Row(
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
                  const SizedBox(width: 3),
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
                                ? const Color.fromARGB(255, 5, 5, 87)
                                : Colors.black,
                            width: isMaleSelected ? 3.5 : 1.5,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25.0)),
                          color: isMaleSelected
                              ? const Color.fromARGB(255, 87, 193, 222)
                              : Colors.transparent,
                        ),
                        child: Column(
                          children: [
                            Hero(
                              tag:
                                  'male_image', 
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(23.0),
                                  topRight: Radius.circular(23.0),
                                ),
                                child: Image.asset(
                                  'assets/male_image2.jpg',
                                  width: 157,
                                  height: 157.5,
                                ),
                              ),
                            ),
                            const Text(
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
                                ? const Color.fromARGB(255, 103, 46, 55)
                                : Colors.black,
                            width: isFemaleSelected ? 3.5 : 1.5,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25.0)),
                          color: isFemaleSelected
                              ? const Color.fromARGB(255, 182, 113, 125)
                              : Colors.transparent,
                        ),
                        child: Column(
                          children: [
                            Hero(
                              tag:
                                  'female_image', 
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(23.0),
                                  topRight: Radius.circular(23.0),
                                ),
                                child: Image.asset(
                                  'assets/female_image6.jpg',
                                  width: 158.5,
                                  height: 157.5,
                                ),
                              ),
                            ),
                            const Text(
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
              const SizedBox(height: 30),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 163,
                      height: 200,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 0, 0, 0)),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25.0)),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            "Height",
                            style: subheadinghw,
                          ),
                          Text("$height", style: hewecolor),
                          const Text(
                            "Cm",
                            style: subheadinghwj,
                          ),
                          Row(
                            children: [
                              const SizedBox(width: 10),
                              FloatingActionButton(
                                heroTag:
                                    'height_minus', 
                                backgroundColor:
                                    const Color.fromARGB(255, 35, 13, 108),
                                onPressed: () {
                                  setState(() {
                                    if (height > 80) height--;
                                    bmi = calculateBMI(
                                        height: height, weight: weight);
                                  });
                                },
                                child: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                  size: 40,
                                ),
                                shape: const CircleBorder(),
                              ),
                              const SizedBox(width: 35),
                              FloatingActionButton(
                                heroTag:
                                    'height_plus', 
                                backgroundColor:
                                    const Color.fromARGB(255, 35, 13, 108),
                                onPressed: () {
                                  setState(() {
                                    if (height < 200) height++;
                                    bmi = calculateBMI(
                                        height: height, weight: weight);
                                  });
                                },
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 40,
                                ),
                                shape: const CircleBorder(),
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
                      width: 165,
                      height: 200,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25.0)),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            "Weight",
                            style: subheadinghw,
                          ),
                          Text("$weight", style: hewecolor),
                          const Text(
                            "Kg",
                            style: subheadinghwj,
                          ),
                          Row(
                            children: [
                              const SizedBox(width: 10),
                              FloatingActionButton(
                                heroTag:
                                    'weight_minus',
                                backgroundColor:
                                    const Color.fromARGB(255, 35, 13, 108),
                                onPressed: () {
                                  setState(() {
                                    if (weight > 20) weight--;
                                    bmi = calculateBMI(
                                        height: height, weight: weight);
                                  });
                                },
                                child: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                  size: 40,
                                ),
                                shape: const CircleBorder(),
                              ),
                              const SizedBox(width: 35),
                              FloatingActionButton(
                                heroTag:
                                    'weight_plus', 
                                backgroundColor:
                                    const Color.fromARGB(255, 35, 13, 108),
                                onPressed: () {
                                  setState(() {
                                    if (weight < 120) weight++;
                                    bmi = calculateBMI(
                                        height: height, weight: weight);
                                  });
                                },
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 40,
                                ),
                                shape: const CircleBorder(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: calculateBMIAndNavigate,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: const BorderSide(color: Colors.black, width: 2.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                ),
                child: const Text(
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

  double calculateBMI({required int height, required int weight}) {
    return (weight / (height * height)) * 10000;
  }
}
