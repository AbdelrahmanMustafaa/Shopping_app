import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopping_app/Database/auth_database.dart';
import 'package:shopping_app/api_model/api_handler.dart';
import 'package:shopping_app/api_model/products_model.dart';
import 'package:shopping_app/reusable/my_colors.dart';

import 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit._internal() : super(AppInitial());

  static final AppCubit _instance = AppCubit._internal();

  factory AppCubit()=>_instance ;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  bool enabled = false;

  changeToEnabled()
  {
    enabled = true ;
    emit(ChangeEnabledState());
  }

  changeToUnEnabled()
  {
    enabled = false ;
    emit(ChangeEnabledState());
  }


  int _i = 1;
  setI (int x)
  {
    _i = x ;
  }
 int getI ()
  {
    return _i ;
  }

  bool dark= false ;
  changDarkMode ()
  {
    dark = !dark ;
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

  signUp(TextEditingController emailController,
      TextEditingController passwordController) {
    try {
      print('========================================================');
      print('signUp in cubit');
      databaseHandler.signUpAuth(emailController.text, passwordController.text);
      emit(SignUpSuccess());
    } catch (e) {
      print('========================================================');
      print('signUp in cubit error');
      print(e.toString());
      emit(SignUpError());
    }
  }

  TextEditingController signInEmailController = TextEditingController();
  TextEditingController signInPasswordController = TextEditingController();

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

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void validateAndSave(
      TextEditingController email, TextEditingController password) async {
    final FormState? form = formKey.currentState;
    if (form!.validate()) {
      print('Form is valid');
      await signUp(email, password);
    } else {
      print('Form is invalid');
    }
  }
  int curvedIndex = 1 ;
 int getIndex(index)
  {
    curvedIndex = index ;
    emit(ChangeCIndex());
    return curvedIndex ;
  }


  List<Icon> icons = [
    Icon(Icons.shopping_cart,color: Colors.white,) ,
    Icon(Icons.home ,color: Colors.white) ,
    Icon(Iconsax.heart5 ,color: Colors.white) ,

  ];


  int initPage = 2 ;
  getInitPage (int index)
  {
    initPage = index ;
    print ('===========================$initPage $index');
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

  String linkedIn = 'https://www.linkedin.com/in/abdelrahman-mostafa-ali-hagag-72580a1b9';
}
