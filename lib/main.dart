//CREATED BY MAX
//CREATED BY MAX
//CREATED BY MAX


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer/timer_provider.dart';

import 'main_page.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<TimerProvider>(
        create: (_) => TimerProvider(),
        child: const MainPage()),
    );
  }
}

