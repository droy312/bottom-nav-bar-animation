import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin {
  double height = 100;
  double width = 411.43;

  int index = 0;

  bool isPressed;

  AnimationController a1, a2;

  @override
  void initState() {
    super.initState();

    isPressed = true;

    a1 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 600));
    a2 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 400));
  }

  void startAnimation(int i) {
    setState(() {
      isPressed = false;
      index = i;
    });
    a1.forward().then((value) => a2.forward().then((value) => resetAnimation()));
  }

  void resetAnimation() {
    setState(() {
      isPressed = true;
    });
    a2.reset();
    a1.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height - 200,
            color: Colors.white,
          ),
          AnimatedBuilder(
            animation: a2,
            builder: (context, child) => AnimatedBuilder(
            animation: CurvedAnimation(curve: Curves.fastOutSlowIn, parent: a1),
            builder: (context, child) {
              return Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Stack(
                  children: [
                    Positioned(
                      top: 60,
                      left: (MediaQuery.of(context).size.width - width) / 2,
                      child: Container(
                        height: height,
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.blue.withOpacity(.6),
                              Colors.white,
                            ],
                          ),
                        ),
                      ),
                    ),

                    //* 0
                    Positioned(
                      top: 80 - (index == 0 ? (80 * a1.value) : 0.0),
                      left:
                          (1 * (MediaQuery.of(context).size.width - 120) / 5) +
                              (0 * 30),
                      child: IconButton(
                        onPressed: () {
                          isPressed ? startAnimation(0) : resetAnimation();
                        },
                        icon: Icon(
                          index == 0 ? Icons.home : Icons.home_outlined,
                          size: 30 * (index == 0 ? (1.0-a2.value) : 1.0),
                        ),
                      ),
                    ),

                    //* 1
                    Positioned(
                      top: 80 - (index == 1 ? (80 * a1.value) : 0.0),
                      left:
                          (2 * (MediaQuery.of(context).size.width - 120) / 5) +
                              (1 * 30),
                      child: IconButton(
                        onPressed: () {
                          isPressed ? startAnimation(1) : resetAnimation();
                        },
                        icon: Icon(
                          index == 1
                              ? Icons.question_answer
                              : Icons.question_answer_outlined,
                          size: 30 * (index == 1 ? (1.0-a2.value) : 1.0),
                        ),
                      ),
                    ),

                    //* 2
                    Positioned(
                      top: 80 - (index == 2 ? (80 * a1.value) : 0.0),
                      left:
                          (3 * (MediaQuery.of(context).size.width - 120) / 5) +
                              (2 * 30),
                      child: IconButton(
                        onPressed: () {
                          isPressed ? startAnimation(2) : resetAnimation();
                        },
                        icon: Icon(
                          index == 2
                              ? Icons.file_copy
                              : Icons.file_copy_outlined,
                          size: 30 * (index == 2 ? (1.0-a2.value) : 1.0),
                        ),
                      ),
                    ),

                    //* 3
                    Positioned(
                      top: 80 - (index == 3 ? (80 * a1.value) : 0.0),
                      left:
                          (4 * (MediaQuery.of(context).size.width - 120) / 5) +
                              (3 * 30),
                      child: IconButton(
                        onPressed: () {
                          isPressed ? startAnimation(3) : resetAnimation();
                        },
                        icon: Icon(
                          index == 3 ? Icons.person : Icons.person_outline,
                          size: 30 * (index == 3 ? (1.0-a2.value) : 1.0),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          ),
        ],
      )),
    );
  }
}
