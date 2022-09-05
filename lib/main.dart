import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/reusable/my_colors.dart';
import 'package:shopping_app/screens/connect_us/connect_us.dart';
import 'package:shopping_app/screens/product_details/product_details.dart';
import 'package:shopping_app/screens/sign_in_screen/screen/sign_in_screen.dart';
import 'package:shopping_app/screens/sign_up_screen/screen/sign_up_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shopping_app/screens/splash_screen/splash_screen.dart';
import 'package:shopping_app/test.dart';
import 'package:sizer/sizer.dart';
import 'app_cubit/app_cubit.dart';
import 'app_cubit/observer/observer.dart';
import 'screens/home_screen/screen/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
// make bloc observer
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: myDarkBLue,
        ),
      ),
      // test comment
      debugShowCheckedModeBanner: false,
      home: Sizer(
        builder: (context, orientation, deviceType) {
          return const HomeScreen();
        },
      ),
    );
  }
}
