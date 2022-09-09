import 'package:flutter/material.dart';

class CompleteMatchScreen extends StatefulWidget {
  const CompleteMatchScreen({Key? key}) : super(key: key);

  @override
  State<CompleteMatchScreen> createState() => _CompleteMatchScreenState();
}

class _CompleteMatchScreenState extends State<CompleteMatchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              "No Complete match available",
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
