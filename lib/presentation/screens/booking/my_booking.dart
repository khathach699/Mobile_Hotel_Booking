import 'package:flutter/material.dart';

class MyBookingScreen extends StatelessWidget {
  const MyBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Booking')),
      body: Center(
        child: Text(
          'Booking Screen',
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
    );
  }
}
