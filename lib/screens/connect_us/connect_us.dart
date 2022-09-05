import 'package:flutter/material.dart';

class Connect_Us extends StatelessWidget {
  const Connect_Us({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/pattern white background .png')
          )
        ),
        child: Column(
          children: [
            ListView.builder(
              itemBuilder: (context , index) =>
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [

                    ],
                  ),
                )

            )
          ],
        ),
      ),
    );
  }
}
