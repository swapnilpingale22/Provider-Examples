import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/count_provider.dart';

class Example1 extends StatelessWidget {
  const Example1({super.key});

  @override
  Widget build(BuildContext context) {
    print('main widget build');
    final countprov = Provider.of<CountProvider>(
      context,
      listen: false,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Count Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CountProvider>(
              builder: (context, value, child) {
                print('this widget build');
                return Text(
                  value.count.toString(),
                  style: const TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countprov.setCount();
          print(countprov.count.toString());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
