import 'package:flutter/material.dart';

class FoodCalculator extends StatefulWidget {
  const FoodCalculator({super.key});

  @override
  State<FoodCalculator> createState() => _FoodCalculatorState();
}

class _FoodCalculatorState extends State<FoodCalculator> {
  TextEditingController weightController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  String petType = 'Cat';
  String activityLevel = 'Not Active';
  double foodAmount = 0.0;
  String message = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pet Food Planner'),
      ),
      backgroundColor:Color.fromARGB(255, 123, 227, 182),
      body: Center(
        child: 
        SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16.0),
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 242, 241, 226),
              border: Border.all(color:Color.fromARGB(255, 4, 4, 4)),
              borderRadius: BorderRadius.circular(10),
            ),

            width: 320,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 15),
                Row(
                  children: [
                    Text('Weight', style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    //jarakkan input form dari label
                    SizedBox(width: 30),
                    SizedBox(
                      width: 165,
                      child: TextField(
                        controller: weightController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter weight (kg)',
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10),

                Row(
                  children: [
                    SizedBox(
                      //jarakkan input form dari label
                      width: 76,
                      child: Text('Age:', style: TextStyle(fontWeight: FontWeight.bold,),
                      ),
                    ),
                    SizedBox(
                      width: 165,
                      child: TextField(
                        controller: ageController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Age (yrs old)',
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10),

                Row(
                  children: [
                    SizedBox(width: 80, child: Text('Type:', style: TextStyle(fontWeight: FontWeight.bold,),
                      ),
                    ),
                    DropdownButton<String>(
                      value: petType,
                      items: <String>['Cat', 'Dog'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        petType = newValue!;
                        setState(() {});
                      },
                    ),
                  ],
                ),

                SizedBox(height: 10),

                Row(
                  children: [
                    SizedBox(
                      width: 80,
                      child: Text('Activity:', style: TextStyle(fontWeight: FontWeight.bold,),
                      ),
                    ),
                    DropdownButton<String>(
                      value: activityLevel,
                      items: <String>['Not Active', 'Active', 'Very Active']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        activityLevel = newValue!;
                        setState(() {});
                      },
                    ),
                  ],
                ),

                SizedBox(height: 20),

                Row(
                  //centerkan kedua dua btn 
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: calculateFood,
                      child: Text('Calculate'),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: resetFields,
                      child: Text('Reset'),
                    ),
                  ],
                ),

                SizedBox(height: 20),

                 //this display text for err message
                Center(
                  child: Text(
                    message,
                    style: TextStyle(color: Colors.red),
                  ),
                ),

                SizedBox(height: 10),

                Center(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    color: Color.fromARGB(255, 243, 222, 159),
                    child: Text(
                      'Recommended food: ${foodAmount.toStringAsFixed(1)} gram/day',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void calculateFood() {

    //check null value first
    if (weightController.text.isEmpty || ageController.text.isEmpty) {
      message = 'Fill in all fields!';
      foodAmount = 0;
      setState(() {});
      return;
    }

    double weight = double.parse(weightController.text);
    int age = int.parse(ageController.text);
    double foodIntake = 0;

    if (petType == 'Cat') {
      if (activityLevel == 'Not Active') {
        foodIntake = 30;
      } else if (activityLevel == 'Active') {
        foodIntake = 35;
      } else {
        foodIntake = 40;
      }
    } else {
      //dog need bigger portion
      if (activityLevel == 'Not Active') {
        foodIntake = 40;
      } else if (activityLevel == 'Active') {
        foodIntake = 50;
      } else {
        foodIntake = 60;
      }
    }

    if (weight <= 0 || age <= 0) {
      message = 'Enter valid positive numbers!';
      foodAmount = 0;
    } else {
      foodAmount = weight * foodIntake;
      message = '';
    }

    setState(() {});
  }

  void resetFields() {
    weightController.clear();
    ageController.clear();
    petType = 'Cat';
    activityLevel = 'Not Active';
    foodAmount = 0;
    message = '';
    setState(() {});
  }
}