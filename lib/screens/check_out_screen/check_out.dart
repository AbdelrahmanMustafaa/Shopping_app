import 'package:flutter/material.dart';

class Check_out extends StatelessWidget {
  const Check_out({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('images/pattern white background .png'),
          ),
        ),
      ),
    );
  }
}
