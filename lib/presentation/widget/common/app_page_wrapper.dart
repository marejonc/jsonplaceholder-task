import 'package:flutter/material.dart';

class AppPageWrapper extends StatelessWidget {
  const AppPageWrapper({required this.title, required this.body, super.key});

  final String title;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade50,
        scrolledUnderElevation: 0,
        title: Text(title),
      ),
      body: body,
    );
  }
}
