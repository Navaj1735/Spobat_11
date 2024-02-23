import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:spobat_11/screen/home_parts/Bottom_nav.dart';

class completed_page extends StatefulWidget {
  const completed_page({super.key});

  @override
  State<completed_page> createState() => _completed_pageState();
}

class _completed_pageState extends State<completed_page> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Botton_navigation()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset('assets/lottie/uploadedsuccess.json'),
      ),
    );
  }
}
