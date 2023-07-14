import 'package:flutter/material.dart';
import './UploadScreen.dart';
import './feedscreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome AYUSH!",
              style: TextStyle(fontSize: 25, color: Colors.black),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: width * 0.7,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(55, 124, 172, 67),
                  Color.fromRGBO(11, 73, 110, 43),
                ], begin: Alignment.centerLeft, end: Alignment.centerRight),
              ),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                ),
                child: Text('Feeds'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FeedScreen()),
                  );
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: width * 0.7,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(55, 124, 172, 67),
                  Color.fromRGBO(11, 73, 110, 43),
                ], begin: Alignment.centerLeft, end: Alignment.centerRight),
              ),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                ),
                child: Text('Upload Image'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UploadScreen()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
