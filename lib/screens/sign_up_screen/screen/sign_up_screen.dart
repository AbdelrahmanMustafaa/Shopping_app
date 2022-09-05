import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../app_cubit/app_cubit.dart';
import '../../../app_cubit/app_state.dart';
import '../../../reusable/reusable_widgets.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = BlocProvider.of<AppCubit>(context);
          return Form(
            key: cubit.formKey,
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: Stack(
                children: [
                  Image.asset(
                    'images/startup page.png',
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                  ),
                  Scaffold(
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
                                          Navigator.pop(context);
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                        myTextField(
                                            controller:
                                                cubit.signUpNameController,
                                            context: context),
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
                                        myTextField(
                                            controller: emailController,
                                            context: context),
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
                                        myTextField(
                                            isPassword: cubit.showPassword,
                                            controller: passwordController,
                                            iconButton: IconButton(
                                              icon: cubit.mainIcon,
                                              onPressed: () {
                                                cubit.changeEyeIcon();
                                              },
                                            ),
                                            context: context),
                                        const SizedBox(
                                          height: 70,
                                        ),
                                        myButton(
                                          'Sign Up',
                                          context,
                                          () {
                                            cubit.validateAndSave(
                                           emailController,
                                            passwordController,
                                            );
                                          },
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
