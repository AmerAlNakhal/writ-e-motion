import 'dart:io';

import 'package:flutter/material.dart';

class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
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
      body: SafeArea(
        child: Stack(
          children: [
            //Info
            Center(
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.black38,
                  border: Border.all(
                    color: Colors.white60,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(60),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 30,
                    left: 20,
                    right: 10,
                  ),
                  child: Text(
                    'This app help you to write any thing in your feelings, '
                    'without try to think what you shuold write, '
                    'thats mean  : you will take a pic and that\'s it, '
                    'I\'ll transfer your emotion to some words that expresses it... '
                    'if you like it... \nclick on \' > \' and start to write with your emotions 😉',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ),

            //Next&Exit
            Positioned(
              bottom: 20,
              right: 0,
              left: 0,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //Exit
                    GestureDetector(
                      onTap: () {
                        exit(0);
                      },
                      child: Icon(
                        Icons.close_outlined,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),

                    //Next
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, 'HomeScreen');
                      },
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
