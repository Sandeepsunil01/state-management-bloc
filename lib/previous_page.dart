import 'package:flutter/material.dart';

class PreviousPage extends StatelessWidget {
  const PreviousPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Previous"),
      ),
      body: const Center(
        child: Text(
          "Previous Page",
          style: TextStyle(fontSize: 52),
        ),
      ),
    );
  }
}
