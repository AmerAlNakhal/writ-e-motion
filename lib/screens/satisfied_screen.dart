import 'package:flutter/material.dart';

class SatisfiedScreen extends StatefulWidget {
  @override
  _SatisfiedScreenState createState() => _SatisfiedScreenState();
}

class _SatisfiedScreenState extends State<SatisfiedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'WritEmotion',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Text(
            'S'
        ),
      ),
    );
  }
}
