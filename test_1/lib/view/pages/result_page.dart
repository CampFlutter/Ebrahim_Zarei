import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_1/controller/user_provider.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
        return MaterialApp(
        home: Scaffold(
          backgroundColor: const Color.fromARGB(255, 14, 6, 35),
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 50, left: 30),
                  child: const Text(
                    'YOUR RESULT',
                    style: TextStyle(fontSize: 35, color: Colors.white),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.topCenter,
                    margin: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 20, 14, 41),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      padding: const EdgeInsets.only(top: 50),
                      child: Text(
                        userProvider.bmi.toStringAsFixed(2),
                        style: const TextStyle(fontSize: 45, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    color: const Color.fromARGB(255, 250, 0, 82),
                    height: 70,
                    child: const Text(
                      'Calculate your BMI',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 20, 14, 41),
                      borderRadius: BorderRadius.circular(15)),
                  child: Container(),
                ))
              ],
            ),
          ),
      ),
      );}
  }
