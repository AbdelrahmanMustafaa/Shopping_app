import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/Database/auth_database.dart';
import 'package:shopping_app/screens/home_screen/screen/home_screen.dart';
import '../../../app_cubit/app_cubit.dart';
import '../../../app_cubit/app_state.dart';
import '../../../reusable/my_colors.dart';
import '../../../reusable/reusable_widgets.dart';
import '../../sign_in_screen/screen/sign_in_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = BlocProvider.of<AppCubit>(context);
          GlobalKey<FormState> formKey = GlobalKey<FormState>();

          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('images/startup page.png'),
                ),
              ),
              child: Scaffold(
                resizeToAvoidBottomInset: true,
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_outlined,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 70,
                        ),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.8,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(120),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Already have an account?',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                ),
                                SizedBox(
                                  child: MaterialButton(
                                    // navigate to sign in screen
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SignInScreen(),
                                        ),
                                      );
                                    },
                                    child: const Text('sign in !'),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Column(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          top: 4, bottom: 4, left: 4),
                                      child: Text(
                                        'NAME',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    // name field
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.grey[400],
                                      ),
                                      child: TextFormField(
                                        controller: cubit.signUpNameController,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            // show dialog
                                            return 'this field can\'t be empty';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
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
                                        'E-MAIL',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    // email field
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.grey[400],
                                      ),
                                      child: TextFormField(
                                        controller: cubit.signUpEmailController,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            // show dialog
                                            return 'this field can\'t be empty';
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
                                            cubit.signUpPasswordController,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            // show dialog
                                            return 'this field can\'t be empty';
                                          }
                                          return null;
                                        },
                                        obscureText: cubit.showPassword,
                                        decoration: InputDecoration(
                                          suffixIcon: IconButton(
                                            icon: cubit.mainIcon,
                                            onPressed: () {
                                              cubit.changeEyeIcon();
                                            },
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
                                      height: 70,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      width: MediaQuery.of(context).size.width,
                                      child: MaterialButton(
                                        onPressed: () {
                                          cubit.validateAndSave(
                                              context,
                                              cubit.signUpNameController,
                                              cubit.signUpEmailController,
                                              cubit.signUpPasswordController);
                                          print(cubit.validate);
                                          print(
                                              '==================------------=========================');
                                          if (cubit.validate == true) {
                                            print(cubit.validate);
                                            print('sign up in screen');
                                            cubit.signUp(
                                                cubit.signUpEmailController,
                                                cubit.signUpPasswordController,
                                                context);
                                          }
                                        },
                                        color: myLightBlack,
                                        textColor: Colors.white,
                                        child: Text(
                                          'Sign Up',
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 15,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
