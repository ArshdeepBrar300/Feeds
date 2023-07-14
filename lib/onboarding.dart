import 'package:feeds/HomeScreen.dart';
import 'package:flutter/material.dart';
import './OnboardingModel.dart';
import './ProgressButton.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final String subt =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

  List<OnboardingModel> onb = [
    OnboardingModel("assets/onb1.jpg", "About us", "ST1", 0.5),
    OnboardingModel("assets/onb2.jpg", "Our Mission", "ST2", 0.75),
    OnboardingModel("assets/onb3.jpg", "Our Vision", "ST3", 1.0),
  ];

  Widget getScreen(int ind) {
    final height = MediaQuery.of(context).size.height;
    return Container(
        child: Column(children: [
      SizedBox(
        height: height * 0.12,
      ),
      Center(
        child: Image.asset(
          onb[ind].img,
          height: height * 0.2,
        ),
      ),
      SizedBox(
        height: height * 0.12,
      ),
      Container(
        width: MediaQuery.of(context).size.width * 0.85,
        height: height * 0.42,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          gradient: LinearGradient(colors: [
            Color.fromRGBO(55, 124, 172, 67),
            Color.fromRGBO(11, 73, 110, 43),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Column(children: [
          SizedBox(
            height: 30,
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(20),
            child: Text(
              onb[ind].title,
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            height: height * 0.13,
            padding: EdgeInsets.all(10),
            alignment: Alignment.topLeft,
            child: Text(subt,
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.white.withOpacity(0.6),
                )),
          ),
          ind == 2
              ? ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    fixedSize: Size(65, 65),
                    shape: CircleBorder(),
                  ),
                  child: ind != 2
                      ? Icon(Icons.arrow_forward)
                      : Text("Ready", style: TextStyle(fontSize: 10)),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return HomeScreen();
                    }));
                  })
              : ProgressButton(
                  progress: onb[ind].progress,
                  onPressed: () {
                    currIndex++;
                    setState(() {});
                  }),
        ]),
      )
    ]));
  }

  int currIndex = 0;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(
                      Size.fromWidth(width * 0.3),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.blue)),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    shadowColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  child:
                      Text('Skip Intro', style: TextStyle(color: Colors.blue)),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return HomeScreen();
                    }));
                  },
                ),
              ),
              getScreen(currIndex),
            ],
          ),
        ));
  }
}
