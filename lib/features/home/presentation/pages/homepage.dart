import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const Homepage(),
      );
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.add_circle_outline))
        ],
      ),
    );
  }
}
