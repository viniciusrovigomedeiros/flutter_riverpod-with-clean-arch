import 'dart:async';
import 'package:flutter/material.dart';

import 'home_page.dart';

class AnimatingBg1 extends StatefulWidget {
  @override
  _AnimatingBg1State createState() => _AnimatingBg1State();
}

class _AnimatingBg1State extends State<AnimatingBg1>
    with TickerProviderStateMixin {
  List<Color> colorList = [
    Color.fromARGB(255, 5, 5, 5),
    Color.fromARGB(255, 15, 15, 15),
    Color.fromARGB(255, 25, 25, 25),
    Color.fromARGB(255, 35, 35, 35),
    Color.fromARGB(255, 45, 45, 45),
    Color.fromARGB(255, 5, 5, 5),
    Color.fromARGB(255, 15, 15, 15),
    Color.fromARGB(255, 25, 25, 25),
    Color.fromARGB(255, 35, 35, 35),
    Color.fromARGB(255, 45, 45, 45),
  ];
  List<Alignment> alignmentList = [Alignment.topCenter, Alignment.bottomCenter];
  int index = 0;
  Color bottomColor = Color(0xff092646);
  Color topColor = Color(0xff410D75);
  Alignment begin = Alignment.bottomCenter;
  Alignment end = Alignment.topCenter;

  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then(
      (value) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      ),
    );
    super.initState();
    Timer(
      Duration(seconds: 3),
      () {
        setState(
          () {
            bottomColor = Color(0xff33267C);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 2),
      onEnd: () {
        setState(
          () {
            index = index + 1;
            bottomColor = colorList[index % colorList.length];
            topColor = colorList[(index + 1) % colorList.length];
          },
        );
      },
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: begin,
          end: end,
          colors: [bottomColor, topColor],
        ),
      ),
    );
  }
}
