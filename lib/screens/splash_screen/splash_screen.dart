import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/screens/sign_in_screen/screen/sign_in_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset('images/startup page.png'),
      loadingText: const Text(
        'Welcome To Shopping App',
        style: TextStyle(fontSize: 20 ,
        color: Colors.white
        ),
      ),
      backgroundImage:const AssetImage('images/startup page.png'),

      durationInSeconds: 3,
      navigator:const SignInScreen(),
      logoSize: 0,
      loaderColor: Colors.white,
    );
  }
}
