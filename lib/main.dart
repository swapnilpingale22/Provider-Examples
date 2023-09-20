// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_examples/provider/auth_provider.dart';
import 'package:provider_examples/provider/count_provider.dart';
import 'package:provider_examples/provider/example2_provider.dart';
import 'examples/example1.dart';
import 'examples/example2.dart';
import 'examples/example3.dart';
import 'examples/example4.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CountProvider()),
        ChangeNotifierProvider(create: (context) => Example2Provider()),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
      ],
      child: MaterialApp(
        title: 'Provider Examples',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          // scaffoldBackgroundColor: Colors.grey.shade900,

          // useMaterial3: true,
        ),
        home: const Example4(),
      ),
    );
  }
}
