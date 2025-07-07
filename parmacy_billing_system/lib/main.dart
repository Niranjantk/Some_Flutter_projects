import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Desktop App',
      home: Scaffold(
        appBar: AppBar(title: const Text('data')),
        body: Row(
          children: [
            NavigationRail(
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text('Home'),
                ),
              ],
              selectedIndex: 0,
            ),
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(
              child: Center(child: Text('Welcome to your desktop app!')),
            ),
          ],
        ),
      ),
    );
  }
}
