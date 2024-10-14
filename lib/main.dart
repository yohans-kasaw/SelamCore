import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Selam Core"),
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
          body: const Center(
              child: Column(
                  children: <Widget>[Text("hello Wolrd"), Icon(Icons.add)])),
        ));
  }
}
