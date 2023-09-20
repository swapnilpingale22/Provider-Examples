// ignore_for_file: avoid_print, must_be_immutable, prefer_final_fields

import 'package:flutter/material.dart';

class Example3 extends StatelessWidget {
  Example3({super.key});

  ValueNotifier _counter = ValueNotifier<int>(0);

  ValueNotifier<bool> toggle = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    print('widget build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example 3'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ValueListenableBuilder(
            valueListenable: toggle,
            builder: (context, value, child) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  obscureText: toggle.value,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: const OutlineInputBorder(),
                    suffix: IconButton(
                      onPressed: () {
                        toggle.value = !toggle.value;
                      },
                      icon: Icon(
                        toggle.value ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 50),
          Center(
            child: ValueListenableBuilder(
              valueListenable: _counter,
              builder: (context, value, child) => Text(
                value.toString(),
                style: const TextStyle(
                  // color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.value++;
          print(_counter.value);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
