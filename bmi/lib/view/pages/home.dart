import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_1/controller/user_provider.dart';
import 'package:test_1/view/widgets/gender_button.dart';
import 'package:test_1/view/widgets/weight_box.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return ChangeNotifierProvider(
      create: (BuildContext context) => UserProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: const Color.fromARGB(255, 14, 6, 35),
          appBar: AppBar(
            title: const Text(
              'BMI Calculator',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            backgroundColor: const Color.fromARGB(255, 20, 8, 49),
          ),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                         const Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: GenderButton(gender: Gender.male,),
                              ),
                              Expanded(
                                child: GenderButton(gender: Gender.female,),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 20, 14, 41)),
                            margin: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'Height',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.grey),
                                ),
                                const Spacer(),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(user.height.toString(),
                                          style: const TextStyle(
                                              height: 1,
                                              fontSize: 30,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    const Text('CM',
                                        style: TextStyle(
                                            fontSize: 13, color: Colors.grey)),
                                  ],
                                ),
                                Container(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Slider(
                                    value: user.height.toDouble(),
                                    max: 200,
                                    min: 1,
                                    onChanged: (value) {
                                      user.height = value.toInt();
                                    },
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: WeightBox(),
                              ),
                              // Expanded(
                              //   child: WeightBox(),
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    user.calBmi();
                    Navigator.pushNamed(context, 'resultPage');
                  },
                  child: Container(
                    alignment: Alignment.center,
                    color: const Color.fromARGB(255, 250, 0, 82),
                    height: 60,
                    child: const Text(
                      'Calculate your BMI',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
