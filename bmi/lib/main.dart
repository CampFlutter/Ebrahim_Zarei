import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_1/controller/user_provider.dart';
import 'package:test_1/view/pages/home.dart';
import 'package:test_1/view/pages/result_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MaterialApp(
        initialRoute: 'home',
        debugShowCheckedModeBanner: false,
        routes: {
          'home': (context) => const MyApp(),
          'resultPage': (context) => const ResultPage()
        },
      ),
    ),
  );
}
