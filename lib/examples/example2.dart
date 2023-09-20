// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/example2_provider.dart';

class Example2 extends StatefulWidget {
  const Example2({super.key});

  @override
  State<Example2> createState() => _Example2State();
}

class _Example2State extends State<Example2> {
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example 2'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<Example2Provider>(
            builder: (context, valuepr, child) {
              return Column(
                children: [
                  Slider(
                    value: valuepr.value,
                    onChanged: (newValue) {
                      valuepr.setValue(newValue);
                      print('widget build');
                    },
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 300,
                          color: Colors.orangeAccent.withOpacity(valuepr.value),
                          child: const Center(
                            child: Text(
                              'Container 1',
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 300,
                          color: Colors.indigo.withOpacity(valuepr.value),
                          child: const Center(
                            child: Text(
                              'Container 2',
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
