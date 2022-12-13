import 'package:bmi/helpers/bmi_calculator.dart';
import 'package:bmi/view/bmi_result_screen.dart';
import 'package:bmi/constants/constant.dart';
import 'package:flutter/material.dart';

class BmiDataScreen extends StatefulWidget {
  const BmiDataScreen({super.key});

  @override
  State<BmiDataScreen> createState() => _BmiDataScreenState();
}

class _BmiDataScreenState extends State<BmiDataScreen> {
  int height = 100;
  int weight = 50;
  int age = 20;
  String? gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("BMI Calculator"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      gender = "male";
                      setState(() {});
                    },
                    child: BmiCard(
                      borderColor:
                          (gender == "male") ? Colors.white : primaryColor,
                      child: GenderIconText(
                        title: "Male",
                        icon: Icons.male,
                        iconTextColor:
                            (gender == "male") ? Colors.white : Colors.white60,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      gender = "female";
                      setState(() {});
                    },
                    child: BmiCard(
                      borderColor:
                          (gender == "female") ? Colors.white : primaryColor,
                      child: GenderIconText(
                        title: "Female",
                        icon: Icons.female,
                        iconTextColor: (gender == "female")
                            ? Colors.white
                            : Colors.white60,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: BmiCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Height",
                    style: labelTextStyle.copyWith(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "$height",
                        style: numberTextStyle,
                      ),
                      Text(
                        "cm",
                        style: labelTextStyle.copyWith(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: const SliderThemeData(
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15)),
                    child: Slider(
                      value: height.toDouble(),
                      min: 80,
                      max: 200,
                      thumbColor: Colors.pink,
                      activeColor: Colors.white,
                      onChanged: (value) {
                        height = value.toInt();
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BmiCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Weight",
                          style: labelTextStyle.copyWith(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "$weight",
                          style: numberTextStyle,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RawMaterialButton(
                              onPressed: () {
                                weight -= 1;
                                setState(() {});
                              },
                              elevation: 0,
                              shape: const CircleBorder(),
                              fillColor: Colors.indigo[900],
                              constraints: const BoxConstraints.tightFor(
                                width: 50,
                                height: 50,
                              ),
                              child:
                                  const Icon(Icons.remove, color: Colors.white),
                            ),
                            const SizedBox(width: 20),
                            RawMaterialButton(
                              onPressed: () {
                                weight += 1;
                                setState(() {});
                              },
                              elevation: 0,
                              shape: const CircleBorder(),
                              fillColor: Colors.indigo[900],
                              constraints: const BoxConstraints.tightFor(
                                width: 50,
                                height: 50,
                              ),
                              child: const Icon(Icons.add, color: Colors.white),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: BmiCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Age",
                          style: labelTextStyle.copyWith(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "$age",
                          style: numberTextStyle,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RawMaterialButton(
                              onPressed: () {
                                age--;
                                setState(() {});
                              },
                              elevation: 0,
                              shape: const CircleBorder(),
                              fillColor: Colors.indigo[900],
                              constraints: const BoxConstraints.tightFor(
                                width: 50,
                                height: 50,
                              ),
                              child:
                                  const Icon(Icons.remove, color: Colors.white),
                            ),
                            const SizedBox(width: 20),
                            RawMaterialButton(
                              onPressed: () {
                                age++;
                                setState(() {});
                              },
                              elevation: 0,
                              shape: const CircleBorder(),
                              fillColor: Colors.indigo[900],
                              constraints: const BoxConstraints.tightFor(
                                width: 50,
                                height: 50,
                              ),
                              child: const Icon(Icons.add, color: Colors.white),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          GestureDetector(
            onTap: () {
              final bmiCalculator =
                  BmiCalculator(height: height, weight: weight);
              bmiCalculator.calculateBMI(); 

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) {
                    return BmiResultScreen(
                      bmi: bmiCalculator.bmi!,
                    );
                  }),
                ),
              );
            },
            child: Container(
              height: 80,
              color: Colors.pink,
              child: const Center(
                child: Text(
                  "Calculate BMI",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BmiCard extends StatelessWidget {
  const BmiCard({
    Key? key,
    this.child,
    this.borderColor = primaryColor,
  }) : super(key: key);

  final Widget? child;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.indigo[700],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: borderColor!),
        ),
        margin: const EdgeInsets.all(15),
        child: child);
  }
}

class GenderIconText extends StatelessWidget {
  const GenderIconText({
    Key? key,
    required this.title,
    required this.icon,
    this.iconTextColor = Colors.white60,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final Color? iconTextColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 85,
          color: iconTextColor,
        ),
        const SizedBox(height: 10),
        Text(
          title,
          style: labelTextStyle.copyWith(
            color: iconTextColor,
          ),
        ),
      ],
    );
  }
}
