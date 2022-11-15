import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class lottie extends StatefulWidget {
  const lottie({Key? key}) : super(key: key);

  @override
  State<lottie> createState() => _lottieState();
}

class _lottieState extends State<lottie> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Lottie.asset("lottie/hii.json"),
        ),
      ),
    );
  }
}
