import 'package:flutter/material.dart';

class SpalshScreen extends StatefulWidget {
  @override
  _SpalshScreenState createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, 'HomeScreen');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Stack(
          children: [
            //Writ
            Positioned(
              top: 0,
              left: 80,
              child: Container(
                width: 2,
                height: 360,
                color: Colors.white,
              ),
            ),
            Positioned(
              top: 331,
              left: 32,
              child: Text(
                'Writ',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w900),
              ),
            ),

            //E
            Positioned(
              top: 330,
              left: 132,
              child: Text(
                'E',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 70,
                    fontWeight: FontWeight.w900),
              ),
            ),

            //motions
            Positioned(
              bottom: 0,
              right: 100,
              child: Container(
                width: 2,
                height: 355,
                color: Colors.white,
              ),
            ),
            Positioned(
              bottom: 341,
              right: 22,
              child: Text(
                'motoin',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w900),
              ),
            ),

            //3amerNakhal
            Positioned(
                bottom: 5,
                right: 0,
                left: 0,
                child: Text(
                  '3amerNakhal',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 9,
                    color: Colors.white24,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
