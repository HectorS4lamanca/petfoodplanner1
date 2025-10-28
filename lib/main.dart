import 'package:flutter/material.dart';
import 'foodcalculator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Food Planner',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    
    super.initState();

    Future.delayed(Duration(seconds: 2), ()  {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const FoodCalculator()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 141, 225, 185),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.pets,
              color: Color.fromARGB(255, 0, 0, 0),
              size: 90,
            ),
            const SizedBox(height: 20),
            Text(
              'Pet Food Planner',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blue[900],
              ),
            ),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}