import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/reusable/reusable_widgets.dart';
import 'package:shopping_app/screens/home_screen/screen/home_screen.dart';

import '../../../app_cubit/app_cubit.dart';
import '../../../app_cubit/app_state.dart';
import '../../../reusable/my_colors.dart';
import '../../sign_up_screen/screen/sign_up_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = BlocProvider.of<AppCubit>(context);
          return Scaffold(
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey,
              child: Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Image.asset(
                          'images/startup page.png',
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Image.asset(
                          'images/startup page.png',
                          fit: BoxFit.fitWidth,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.6,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(90),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 50,
                            ),
                            const Text(
                              'Sign In',
                              style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 70,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        top: 4, bottom: 4, left: 4),
                                    child: Text(
                                      'EMAIL',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.grey[400],
                                    ),
                                    child: TextFormField(
                                      controller: cubit.signInEmailController,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          // show dialog
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  elevation: 0,
                                                  backgroundColor: Colors.white,
                                                  title: Text(
                                                    'Error',
                                                  ),
                                                  content: Text(
                                                      'Some fields are empty'),
                                                  actions: <Widget>[
                                                    MaterialButton(
                                                      color: Colors.red,
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: const Text(
                                                        'Ok',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    )
                                                  ],
                                                );
                                              });
                                          return null;
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        suffixIcon: Icon(Icons.email),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                    ),
                                  ),

                                  const Padding(
                                    padding: EdgeInsets.only(
                                        top: 4, bottom: 4, left: 4),
                                    child: Text(
                                      'PASSWORD',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  // password field
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.grey[400],
                                    ),
                                    child: TextFormField(
                                      controller:
                                          cubit.signInPasswordController,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          // show dialog
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  elevation: 0,
                                                  backgroundColor: Colors.white,
                                                  title: Text(
                                                    'Error',
                                                  ),
                                                  content: Text(
                                                      'Some fields are empty'),
                                                  actions: <Widget>[
                                                    MaterialButton(
                                                      color: Colors.red,
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: const Text(
                                                        'Ok',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    )
                                                  ],
                                                );
                                              });
                                          return null;
                                        }
                                        return null;
                                      },
                                      obscureText: cubit.showPassword,
                                      decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            cubit.changeEyeIcon();
                                          },
                                          icon: cubit.mainIcon,
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    width: MediaQuery.of(context).size.width,
                                    child: MaterialButton(
                                      onPressed: () {
                                        cubit.SignInValidateAndSave(
                                            context,
                                            cubit.signInEmailController,
                                            cubit.signInPasswordController);
                                        if (cubit.signInValidate == true) {
                                          cubit.signIn(
                                              cubit.signInEmailController,
                                              cubit.signInPasswordController , context);
                                        }

                                        print('on pressed');
                                      },
                                      color: myLightBlack,
                                      textColor: Colors.white,
                                      child: Text(
                                        'Sign In',
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 15,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Center(
                                    child: MaterialButton(
                                      onPressed: () {
                                        cubit.forgetPassword();

                                      },
                                      child: const Text(
                                        'Forgot Password?',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Not a member?',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      MaterialButton(
                                        // navigate to sign up screen
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  SignUpScreen(),
                                            ),
                                          );
                                        },
                                        child: const Text('SignUp Now'),
                                      )
                                    ],
                                  ) ,
                                  Center(
                                    child: MaterialButton(
                                      // navigate to sign up screen
                                      onPressed: () {
                                        cubit.signInAnonymously(context);

                                      },
                                      child: const Text('keep going anyway' ,
                                      style: TextStyle(
                                        color: Colors.grey
                                      ),),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
