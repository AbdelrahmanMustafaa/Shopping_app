import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopping_app/Database/auth_database.dart';
import 'package:shopping_app/Database/modelConstant.dart';
import 'package:shopping_app/reusable/my_colors.dart';
import 'package:shopping_app/screens/home_screen/screen/home_screen.dart';
import 'package:shopping_app/screens/sign_up_screen/screen/sign_up_screen.dart';
import 'package:sizer/sizer.dart';

import '../screens/sign_in_screen/screen/sign_in_screen.dart';
import 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit._internal() : super(AppInitial());

  static final AppCubit _instance = AppCubit._internal();

  factory AppCubit() => _instance;

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

  bool signUpValidate = false;
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
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('images/pattern white background .png'))),
            width: 70.w,
            height: 30.h,
            child: Center(
                child: CircularProgressIndicator(
              color: myLightBlack,
            )),
          );
        },
      );
      Future.delayed(Duration(seconds: 2), () {
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

  /*signInUsingEmail(email, password) {
    MyDatabaseHandler.instance.signInAuth(email.text, password.text);
  }*/

  signInAnonymously(context) {
    try {
      print('========================================================');
      print('signInAnonymously in cubit');
      databaseHandler.signInAnonymously();
      emit(SignInSuccess());
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    } catch (e) {
      print('========================================================');
      print('signInAnonymously in cubit error');
      print(e.toString());
      emit(SignInError());
    }
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void SignUpValidateAndSave(BuildContext context, TextEditingController name,
      TextEditingController email, TextEditingController password) async {
    if (email.text.isNotEmpty &&
        name.text.isNotEmpty &&
        password.text.isNotEmpty) {
      print(email.text.isEmpty);
      print(name.text.isEmpty);
      print(password.text.isEmpty);
      signUpValidate = true;
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
      signUpValidate = false;
      print(signUpValidate);
      emit(ValidateAndSaveError());
      print('Form is invalid');
    }
  }

  bool signInValidate = false;

  void SignInValidateAndSave(BuildContext context, TextEditingController email,
      TextEditingController password) async {
    if (email.text.isNotEmpty && password.text.isNotEmpty) {
      print(email.text.isEmpty);
      print(password.text.isEmpty);
      signInValidate = true;
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
      signInValidate = false;
      print(signInValidate);
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

  Response? response;

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

  signIn(TextEditingController emailController,
      TextEditingController passwordController, BuildContext context) async {
    try {
      print('========================================================');
      print('signUp in cubit');
      FirebaseAuth auth = FirebaseAuth.instance;
      UserCredential response = await auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      emit(SignInSuccess());
      showDialog(
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('images/pattern white background .png'))),
            width: 70.w,
            height: 30.h,
            child: Center(
                child: CircularProgressIndicator(
              color: myLightBlack,
            )),
          );
        },
      );
      Future.delayed(Duration(seconds: 2), () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
        emailController.clear();
        passwordController.clear();
      });
      return response;
    } on FirebaseException catch (e) {
      print(e.code);
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Weak Password'),
        ));
      } else if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('user-not-found'),
        ));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('wrong-password'),
        ));
      } else if (e.code == 'invalid-email') {
        print(e.code);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('invalid-email'),
        ));
      } else {
        print(e);
        print('Everything is okay');
      }
      emit(SignInError());
      print('on exception');
      print(e.code);
      print(e.toString());
    }
  }

  signOut(context) async {
    print(FirebaseAuth.instance.currentUser);
    print('signOut');
    if (FirebaseAuth.instance.currentUser!.isAnonymous == false) {
      emit(SignOutSuccessState());
      await FirebaseAuth.instance.signOut();
      showDialog(
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('images/pattern white background .png'))),
            width: 70.w,
            height: 30.h,
            child: Center(
                child: CircularProgressIndicator(
              color: myLightBlack,
            )),
          );
        },
      );
      Future.delayed(Duration(seconds: 2), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignInScreen()));
      });
    } else if (FirebaseAuth.instance.currentUser!.isAnonymous) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              elevation: 0,
              backgroundColor: Colors.white,
              title: Text(
                'Should to login',
              ),
              content: Text('you didn\' login using email'),
              actions: <Widget>[
                MaterialButton(
                  color: myLightBlack,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignUpScreen()));
                  },
                  child: const Text(
                    'SignUp',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                MaterialButton(
                  color: myLightBlack,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignInScreen()));
                  },
                  child: const Text(
                    'SignIn',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            );
          });
    }
  }

  forgetPassword(TextEditingController email, context) async {
    try {
      print('reset password!!');
      print(email.text);

      await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('try to login again')));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SignInScreen()));
      emit(ForgetPasswordSuccess());
    } on FirebaseException catch (e) {
      print('Error');
      print(e.code);
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('this email not found'),
          ),
        );
      } else if (e.code == 'invalid-email') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Invalid email'),
          ),
        );
      } else if (e.code == 'unknown') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('please check your email again'),
          ),
        );
      }
    }
  }

  ProductModel? productModel;
  CollectionReference users = FirebaseFirestore.instance.collection('Products');
  List<Map> childAllData = [];

  getChildrenData() async {
    print('getChildrenData');
    emit(GetDataLoadingState());
    QuerySnapshot querySnapshot = await users.get().then((value) {
      emit(GetDataSuccessState());
      print(value.docs);
      return value;
    });
    List<QueryDocumentSnapshot> listdocs = querySnapshot.docs;
    childAllData.add(listdocs[0].data() as Map);
    print('**********children data**********');
    print(childAllData);
  }

  // get kids t-shirts images
  Set? CImages = {};
  Set? CUrl = {};

  Set? ImageNames = {};
  String? Test = '';

  getCImages(int id) async {
    emit(GetCImageLoadingState());
    //get image from firebase storage
    FirebaseStorage storage = FirebaseStorage.instance;
    ListResult ref = await storage.ref('children/t shirts').listAll();
    // get spasific image from firebase storage
    ref.items.forEach((element) async {
      CUrl!.add(await element.getDownloadURL());
      ImageNames!.add(await element.name.split('.').first);
      Test = await storage
          .ref('children/t shirts')
          .child('$id.jpg')
          .getDownloadURL();
      /* for (int i = 0; i < ImageNames!.length; i++) {
        print ('Test');
        print (Test!.toSet());
      }*/
      String refr = await storage
          .ref('children/t shirts')
          .child('${ImageNames!.first}.jpg')
          .getDownloadURL();
      print(refr);
      print(
          '333333333333333333333333333333333CURL3333333333333333333333333333${CUrl}');
      CImages = CUrl;
    });
    CImages!.isEmpty
        ? emit(GetCImageErrorState())
        : emit(GetCImageSuccessState());
    print(state.runtimeType);
    print(Test.runtimeType);
    print('55555555555555555555');
    return Test;
  }

  // get kids main image
  String? childrenImages;
  String? childrenUrl;

  getChildrenImage() async {
    print('get children image');
    emit(GetChildImageLoadingState());
    FirebaseStorage storage = FirebaseStorage.instance;
    ListResult ref = await storage.ref('children').listAll();
    print(
        '****************************************************************************************');
    ref.items.forEach((element) async {
      childrenUrl = await element.getDownloadURL();
      childrenImages = await childrenUrl;
      print(childrenUrl);
      print('childrenUrl');
      emit(GetChildImageSuccessState());
    });
    print(state.runtimeType);
    childrenImages!.isEmpty
        ? emit(GetChildImageErrorState())
        : emit(GetChildImageSuccessState());
    print(state.runtimeType);
  }

  List<Map> menAllData = [];

  String? menImages;
  String? menUrl;


/*
  getMenImage() async {
    //get image from firebase storage
    FirebaseStorage storage = FirebaseStorage.instance;
    ListResult ref = await storage.ref('men').listAll();
    print(
        '****************************************************************************************');
    ref.items.forEach((element) async {
      emit(GetMenImageLoadingState());
      var a = element.getDownloadURL();
      String b = a.toString() ;
      print (b);
      menUrl = await element.getDownloadURL().then((value) {
        emit(GetMenImageSuccessState () );
        print (menUrl);
      }).catchError( (e) {
        emit(GetMenImageErrorState () );
      });
      menImages = await menUrl;
      print(menUrl);
    });
  }
*/

  getMenData() async {
    print('getMenData');
    emit(GetDataLoadingState());
    QuerySnapshot querySnapshot = await users.get().then((value) {
      emit(GetDataSuccessState());
      return value;
    });
    List<QueryDocumentSnapshot> listdocs = querySnapshot.docs;
    menAllData.add(listdocs[1].data() as Map);
    print('********** men data**********');

    print('Men data : $menAllData');
  }

  List<Map> WomenAllData = [];

  String? womenImages;

  String? womenUrl;

  getWomenImage() async {
    emit(GetWomenImageLoadingState());
    //get image from firebase storage
    FirebaseStorage storage = FirebaseStorage.instance;
    ListResult ref = await storage.ref('women').listAll();
    print(
        '****************************************************************************************');
    ref.items.forEach((element) async {
      womenUrl = await element.getDownloadURL();
      womenImages = womenUrl;
      print(womenUrl);
    });
    print(state.runtimeType);
    womenImages!.isEmpty
        ? emit(GetWomenImageErrorState())
        : emit(GetWomenImageSuccessState());
    print(state.runtimeType);
  }

  getWomenData() async {
    emit(GetDataLoadingState());
    QuerySnapshot querySnapshot = await users.get().then((value) {
      emit(GetDataSuccessState());
      return value;
    });
    List<QueryDocumentSnapshot> listdocs = querySnapshot.docs;
    WomenAllData.add(listdocs[2].data() as Map);
    print('*************** women data ***************');
    print(WomenAllData);
  }

  Future? futureTest;

  List<String>? categoriesImages;

  List<String> putCategoriesImages() {
    categoriesImages!.add(childrenImages!);
    categoriesImages!.add(menImages!);
    categoriesImages!.add(womenImages!);
    print('categoriesImages : ${categoriesImages!.length}');
    print(categoriesImages);
    return categoriesImages!;
  }

  List? price = [];
  List? imageUrl = [];

  List keys = [];

  List? id = [];

  List? ppp = [];

  getCData() async {
    getChildrenImage();
    getChildrenData();
    //  getCImages(2);
    keys = await childAllData.first.keys.toList();

    print('keys : ***************  *************');
    childAllData.first.values.toList().forEach(
      (element) {
        print('Element **********************');
        print(element);
        element.forEach(
          (element) async {
            print('Element 2 **********************');
            print(element['price']);
            price!.add(await element['price']);
            print('price : $price');
            id!.add(await element['id']);
            FirebaseStorage storage = FirebaseStorage.instance;
            ppp!.add(await storage
                .ref('children/t shirts')
                .child('${element['id']}.jpg')
                .getDownloadURL());
            // String ref = await storage.ref('children/t shirts').child('${element['id']}.jpg').getDownloadURL();
            print('ref : $ppp');
            print('id : $id');
            print(price!.length);
            print(id!.length);
          },
        );
      },
    );
  }

  //get image name from firebase storage
  List image = [];
}
