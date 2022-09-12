import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopping_app/Database/auth_database.dart';
import 'package:shopping_app/api_model/api_handler.dart';
import 'package:shopping_app/api_model/products_model.dart';
import 'package:shopping_app/reusable/my_colors.dart';
import 'package:shopping_app/screens/home_screen/screen/home_screen.dart';
import 'package:sizer/sizer.dart';

import '../screens/sign_in_screen/screen/sign_in_screen.dart';
import 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit._internal() : super(AppInitial());

  static final AppCubit _instance = AppCubit._internal();

  factory AppCubit() => _instance;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  List cartList = [];
  List wishList = [2];
  var productImage;

  bool enabled = false;

  changeToEnabled() {
    enabled = true;
    emit(ChangeEnabledState());
  }

  changeToUnEnabled() {
    enabled = false;
    emit(ChangeEnabledState());
  }

  int _i = 1;

  setI(int x) {
    _i = x;
  }

  int getI() {
    return _i;
  }

  bool dark = false;

  changDarkMode() {
    dark = !dark;
    emit(ChangeDarkModeState());
  }

  MyDatabaseHandler databaseHandler = MyDatabaseHandler();

  Icon mainIcon = Icon(Icons.visibility);
  bool showPassword = false;

  changeEyeIcon() {
    if (showPassword == false) {
      print('========================================================');
      print('unShow password');
      mainIcon = const Icon(
        Icons.visibility_off,
        color: Colors.black,
      );
      showPassword = true;
      emit(ChangeEyeIcon());
    } else if (showPassword == true) {
      print('========================================================');
      print('show password');
      mainIcon = const Icon(Icons.visibility);
      showPassword = false;
      emit(ChangeEyeIcon());
    }
  }

  TextEditingController signUpNameController = TextEditingController();
  TextEditingController signUpEmailController = TextEditingController();
  TextEditingController signUpPasswordController = TextEditingController();

  bool validate = false;
  bool success = false;
  String? errorMessage;

  signUp(TextEditingController emailController,
      TextEditingController passwordController, BuildContext context) async {
    try {
      print('========================================================');
      print('signUp in cubit');
      FirebaseAuth auth = FirebaseAuth.instance;
      UserCredential response = await auth.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      emit(SignUpSuccess());
      showDialog(
        context: context,
        builder: (context) {
          return Container(
            decoration:BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('images/pattern white background .png')
              )
            ) ,
            width: 70.w,
            height: 30.h,
            child: Center(child: CircularProgressIndicator(
              color: myLightBlack,
            )),
          );
        },
      );
      Future.delayed(Duration (seconds: 2)   , (){
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignInScreen()));
      });

      return response;
    } on FirebaseException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Weak Password'),
        ));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('email-already-in-use'),
        ));
      } else if (e.code == 'invalid-email') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('invalid-email'),
        ));
      } else {
        print(e);
        print('Everything is okay');
      }
      emit(SignUpError());
      print('on exception');
      print(e.code);
      print(e.toString());
    }
  }

  TextEditingController signInEmailController = TextEditingController();
  TextEditingController signInPasswordController = TextEditingController();

  signInUsingEmail(email, password) {
    MyDatabaseHandler.instance.signInAuth(email.text, password.text);
  }

  signInAnonymously() {
    try {
      print('========================================================');
      print('signInAnonymously in cubit');
      databaseHandler.signInAnonymously();
      emit(SignInSuccess());
    } catch (e) {
      print('========================================================');
      print('signInAnonymously in cubit error');
      print(e.toString());
      emit(SignInError());
    }
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void validateAndSave(BuildContext context, TextEditingController name,
      TextEditingController email, TextEditingController password) async {
    if (email.text.isNotEmpty&& name.text.isNotEmpty && password.text.isNotEmpty) {
      print(email.text.isEmpty);
      print(name.text.isEmpty);
      print(password.text.isEmpty);
      validate = true;
      emit(ValidateAndSaveSuccess());

    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            elevation: 0,
            backgroundColor: Colors.white,
            title: Text(
              'Error',
            ),
            content: Text('Please check your fields well'),
            actions: <Widget>[
              MaterialButton(
                color: Colors.red,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Ok',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          );
        },
      );
      validate = false;
      print(validate);
      emit(ValidateAndSaveError());
      print('Form is invalid');
    }
  }

  int curvedIndex = 1;

  int getIndex(index) {
    curvedIndex = index;
    emit(ChangeCIndex());
    return curvedIndex;
  }

  List<Icon> icons = [
    Icon(
      Icons.shopping_cart,
      color: Colors.white,
    ),
    Icon(Icons.home, color: Colors.white),
    Icon(Iconsax.heart5, color: Colors.white),
  ];

  int initPage = 2;

  getInitPage(int index) {
    initPage = index;
    print('===========================$initPage $index');
    emit(GetInitPageState());
  }

  p productsModel = p();
  Response? response;

  getData() async {
    response = await DioHandler.getData();
    p.fromJson(response!.data);
  }

  Icon fillHeart = const Icon(
    Iconsax.heart5,
    color: Colors.red,
    size: 40,
  );
  Icon emptyHeart = const Icon(
    Iconsax.heart,
    size: 40,
  );
  bool isLiked = false;

  changeHeartIcon() {
    print(isLiked);
    isLiked == false ? isLiked = true : isLiked = false;
    print(isLiked);
    emit(ChangeHeartIconState());
  }

  int quantity = 1;

  increaseQuantity() {
    quantity++;
    emit(IncreaseQuantityState());
  }

  decreaseQuantity() {
    quantity > 0 ? quantity-- : null;
    emit(DecreaseQuantityState());
  }

  String whatsApp = 'https://wa.me/201020401778';

  String linkedIn =
      'https://www.linkedin.com/in/abdelrahman-mostafa-ali-hagag-72580a1b9';
}
