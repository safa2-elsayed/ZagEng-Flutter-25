import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BMICalculator(),
    );
  }
}

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  double height = 150.0;
  int weight = 50;
  int age = 18;
  String gender = 'Male';
  double bmi = 0.0;

  void calculateBMI() {
    setState(() {
      bmi = weight / ((height / 100) * (height / 100));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Container(
        color: Color(0xFF87B1E3),
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GenderBox(
                  gender: 'Male',
                  isSelected: gender == 'Male',
                  onTap: () {
                    setState(() {
                      gender = 'Male';
                    });
                  },
                ),
                GenderBox(
                  gender: 'Female',
                  isSelected: gender == 'Female',
                  onTap: () {
                    setState(() {
                      gender = 'Female';
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'Height (cm)',
                    style: TextStyle(fontSize: 18),
                  ),
                  Slider(
                    value: height,
                    min: 100,
                    max: 250,
                    onChanged: (value) {
                      setState(() {
                        height = value;
                      });
                    },
                  ),
                  Text(
                    height.toStringAsFixed(1),
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                WeightAgeBox(
                  label: 'Weight (kg)',
                  value: weight,
                  onChanged: (value) {
                    setState(() {
                      weight = value;
                    });
                  },
                ),
                WeightAgeBox(
                  label: 'Age',
                  value: age,
                  onChanged: (value) {
                    setState(() {
                      age = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateBMI,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFF48C8C),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: Text(
                'CALCULATE',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Your BMI: ${bmi.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class GenderBox extends StatelessWidget {
  final String gender;
  final bool isSelected;
  final VoidCallback onTap;

  GenderBox({required this.gender, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFFF48C8C) : Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(
              gender == 'Male' ? Icons.male : Icons.female,
              size: 50,
              color: isSelected ? Colors.white : Colors.black,
            ),
            Text(
              gender,
              style: TextStyle(
                fontSize: 18,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WeightAgeBox extends StatelessWidget {
  final String label;
  final int value;
  final Function(int) onChanged;

  WeightAgeBox({required this.label, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 18),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  onChanged(value - 1);
                },
              ),
              Text(
                value.toString(),
                style: TextStyle(fontSize: 24),
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  onChanged(value + 1);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}