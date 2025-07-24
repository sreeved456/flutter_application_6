import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CRUD Operations"),
        backgroundColor: const Color.fromARGB(255, 212, 134, 224),
        foregroundColor: const Color.fromARGB(255, 86, 3, 86),
      ),
      floatingActionButton: Icon(Icons.add),
    );
  }
}
