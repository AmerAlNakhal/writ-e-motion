import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

bool loading = true;
File? imageR;
List _output = [];
final imagepicker = ImagePicker();

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  detectimage(File image) async {
    var prediction = await Tflite.runModelOnImage(
        path: image.path,
        numResults: 2,
        threshold: 0.6,
        imageMean: 127.5,
        imageStd: 127.5);

    setState(() {
      _output = prediction!;
      loading = false;
    });
  }

  loadmodel() async {
    await Tflite.loadModel(
        model: 'assets/model_unquant.tflite', labels: 'assets/labels.txt');
  }

  @override
  void initState() {
    super.initState();
    loadmodel().then((value) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  pickimage_camera() async {
    var image = await imagepicker.pickImage(source: ImageSource.camera);
    if (image == null) {
      return null;
    } else {
      imageR = File(image.path);
    }
    detectimage(imageR!);
    print('-------------' + _output[0]['label'].toString());
  }

  pickimage_gallery() async {
    var image = await imagepicker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      return null;
    } else {
      imageR = File(image.path);
    }
    detectimage(imageR!);
    print('-------------' + _output[0]['label'].toString());
  }

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
        child: Padding(
          padding: EdgeInsets.only(top: 60),
          child: Stack(
            children: [
              //Camera
              Positioned(
                top: 60,
                left: 0,
                child: Container(
                  width: 120,
                  height: 2,
                  color: Colors.white,
                ),
              ),
              Positioned(
                top: 8,
                left: 100,
                child: GestureDetector(
                  onTap: () {
                    pickimage_camera();
                  },
                  child: Icon(
                    Icons.camera_alt_rounded,
                    size: 110,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                top: 27,
                left: 30,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.white60,
                      width: 2,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      'Camera',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),

              //Gallery
              Positioned(
                bottom: 140,
                right: 0,
                child: Container(
                  width: 100,
                  height: 2,
                  color: Colors.white,
                ),
              ),
              Positioned(
                bottom: 85,
                right: 86,
                child: GestureDetector(
                  onTap: () {
                    pickimage_gallery();
                  },
                  child: Icon(
                    Icons.image,
                    size: 110,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                bottom: 146,
                right: 25,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.white70,
                      width: 2,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      'Gallery',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),

              //Photo
              loading
                  ? Center(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 60),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 165,
                            height: 165,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white54,
                                width: 2,
                              ),
                            ),
                            child: Center(
                              child:
                                  SpinKitSpinningLines(color: Colors.white70),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Center(
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

                            //SizedBox(10)
                            SizedBox(
                              height: 5,
                            ),

                            //Caption
                            _output != null
                                ? Container(
                                    width: 100,
                                    height: 25,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.white54,
                                          width: 2,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Center(
                                      child: Text(
                                        (_output[0]['label'])
                                            .toString()
                                            .substring(2),
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(
                                    width: 100,
                                    height: 25,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.white54,
                                          width: 2,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Center(
                                      child: Text(
                                        'Caption',
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ),
                                  ),
                          ],
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
                          setState(() {
                            if (_output[0]['label'] == '0 confused') {
                              Navigator.pushReplacementNamed(context, 'DisgustScreen');
                            } else if (_output[0]['label'] == '1 satisfied') {
                              Navigator.pushReplacementNamed(context, 'SatisfiedScreen');
                            }else if(_output[0]['label'] == null){
                              print('No');
                            }
                          });
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
      ),
    );
  }
}
