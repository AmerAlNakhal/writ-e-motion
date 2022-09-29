import 'package:flutter/material.dart';
import 'package:writemotions/screens/home_screen.dart';

class DisgustScreen extends StatefulWidget {
  @override
  _DisgustScreenState createState() => _DisgustScreenState();
}

class _DisgustScreenState extends State<DisgustScreen> {
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
            //Title
            Positioned(
              right: 0,
              left: 0,
              top: 15,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 60),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Photo
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 215,
                          height: 215,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white54,
                              width: 2,
                            ),
                          ),
                          child: Image.file(
                            imageR!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //PlainText
            Padding(
              padding: EdgeInsets.only(
                right: 110,
                top: 50,
              ),
              child: Column(
                children: [
                  Container(
                    width: 250,
                    height: 75,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                    ),
                    child: Center(
                      child: Container(
                        width: 235,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: TextField(
                          // controller: _plainTextController,
                          cursorWidth: 3,
                          cursorRadius: Radius.circular(30),
                          cursorColor: Colors.black,
                          cursorHeight: 18,
                          keyboardType: TextInputType.text,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.start,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            hintText: 'plain text',
                            hintStyle: TextStyle(
                              color: Colors.black38,
                              fontSize: 18,
                            ),
                            prefixIcon: Icon(
                              Icons.text_format,
                              color: Colors.black,
                              size: 30,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
