import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer/timer_provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    TimerProvider timer = Provider.of<TimerProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stopwatch with Provider'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '${timer.hour}h ${timer.minute}m ${timer.seconds}s ',
            style: const TextStyle(
                color: Colors.red, fontWeight: FontWeight.bold, fontSize: 50),
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              (timer.startEnable)
                  ? ElevatedButton(
                      onPressed: timer.start,
                      child: const Text('start'),
                    )
                  : const ElevatedButton(
                      onPressed: null,
                      child: Text('start'),
                    ),
              (timer.stopEnable)
                  ? ElevatedButton(
                      onPressed: timer.stop,
                      child: const Text('stop'),
                    )
                  : const ElevatedButton(
                      onPressed: null,
                      child: Text('stop'),
                    ),
              (timer.continueEnable)
                  ? ElevatedButton(
                      onPressed: timer.continueTimer,
                      child: const Text('continue'),
                    )
                  : const ElevatedButton(
                      onPressed: null,
                      child: Text('continue'),
                    ),
                    (timer.resetEnable)
                  ? ElevatedButton(
                      onPressed: timer.resetTimer,
                      child: const Text('reset'),
                    )
                  : const ElevatedButton(
                      onPressed: null,
                      child: Text('reset'),
                    )
            ],
          )
        ],
      ),
    );
  }
}
