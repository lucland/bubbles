import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            //TODO: add menu button here
            Text(
              "Bubbles",
              style: TextStyle(
                  color: Colors.pinkAccent, fontWeight: FontWeight.w600),
            ),
            //TODO: add category name
            Text(
              " | Technology",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 15.0),
            ),
          ],
        ),
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Container(),
        ],
      ),
    );
  }
}
