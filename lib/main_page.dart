import 'package:bmicalculator/constant.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
                        const Text("176", style: kinputLableColor),
                        Row(
                          children: [
                            FloatingActionButton(
                              onPressed: onHeightMinus,
                              child: Icon(
                                Icons.remove,
                                size: 40,
                              ),
                            ),
                            const SizedBox(width: 25),
                            FloatingActionButton(
                                onPressed: null,
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
                        const Text("76", style: kinputLableColor),
                        Row(
                          children: [
                            FloatingActionButton(
                              onPressed: null,
                              child: Icon(
                                Icons.remove,
                                size: 40,
                              ),
                            ),
                            const SizedBox(width: 25),
                            FloatingActionButton(
                                onPressed: null,
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
                  Text("BMI"),
                  Text(
                    "225.25",
                    style: kinputLableColor,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void onHeightMinus() {
    print("H M");
  }
}
