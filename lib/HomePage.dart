import 'package:flutter/material.dart';
import 'package:flutter_mobile_vision/flutter_mobile_vision.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:ocr_app/widgets/red_button.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isInitialized = false;
  @override
  void initState() {
    FlutterMobileVision.start().then((value) {
      isInitialized = true;
    });
    super.initState();
  }

  _startScan() async {
    List<OcrText> list = List();

    try {
      list = await FlutterMobileVision.read(
        waitTap: true,
        fps: 5,
        multiple: true,
      );

      for (OcrText text in list) {
        print('valueis ${text.value}');
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/ocr.png',
              height: 350,
            ),
            SizedBox(
              height: 0,
            ),
            Text(
              "Experience the OCR",
              textAlign: TextAlign.center,
              style: GoogleFonts.robotoCondensed(
                fontSize: 23,
                color: Color(0xff1d3557),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            //get Started Button..
            InkWell(
              onTap: () {
                _startScan();
              },
              child: RedButton(
                btnTitle: "Start Scanning",
                btnColor: Color(0xffF99746),
                textColor: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
