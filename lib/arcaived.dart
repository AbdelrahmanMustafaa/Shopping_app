import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../app_cubit/app_cubit.dart';
import '../../../app_cubit/app_state.dart';
import '../../../reusable/reusable_widgets.dart';

class SignUpScreen extends StatelessWidget{
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
          return Scaffold(
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
                  resizeToAvoidBottomInset: false,
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
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
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
                                  width: 75,
                                  child: MaterialButton(
                                    // navigate to sign in screen
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('sign in!'),
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
                                        controller: cubit.signUpNameController
                                        , context: context
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
                                    myTextField(
                                      controller: emailController,
                                         context: context

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
                                    myTextField(
                                     context: context ,
                                    controller: passwordController,
                                      iconButton: IconButton(
                                        icon:
                                        const Icon(Icons.remove_red_eye),
                                        onPressed: () {},
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 70,
                                    ),
                                    myButton('Sign Up', context, () {
                                      cubit.signUp(emailController,
                                          passwordController);
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
              ],
            ),
          );
        },
      ),
    );
  }
}

/*

SingleChildScrollView(
scrollDirection: Axis.horizontal,
child: Row(
children: [
Container(
height: 20.h,
width: 40.w,
color: Colors.grey.withOpacity(0.2),
padding: const EdgeInsets.all(8.0),
child: InkWell(
onTap: () {
print('family');
},
child: Column(
children: [
Image(
width: 40.w,
height: 15.h,
image: const AssetImage(
'images/family shopping.PNG'),
fit: BoxFit.fitWidth,
),
Text('family',
style: TextStyle(
fontWeight:
FontWeight.bold,
fontSize: 15.sp)),
],
),
),
),
SizedBox(width: 2.w),
Container(
height: 20.h,
width: 40.w,
color: Colors.grey.withOpacity(0.2),
padding: const EdgeInsets.all(8.0),
child: InkWell(
onTap: () {
print('men');
},
child: Column(
children: [
Image(
width: 40.w,
height: 15.h,
image: const AssetImage(
'images/man shopping.jpg'),
fit: BoxFit.cover,
),
Text('men',
style: TextStyle(
fontWeight:
FontWeight.bold,
fontSize: 15.sp),
),
],
),
),
),
SizedBox(width: 2.w),
Container(
color: Colors.grey.withOpacity(0.2),
padding: const EdgeInsets.all(8.0),
height: 20.h,
width: 40.w,
child: InkWell(
onTap: () {
print('women');
},
child: Column(
children: [
Image(
height: 15.h,
width: 40.w,
image: const AssetImage(
'images/woman shopping.jpg'),
fit: BoxFit.fitWidth,
),
Text(
'women',
style: TextStyle(
fontWeight:
FontWeight.bold,
fontSize: 15.sp),
),
],
),
),
),
SizedBox(width: 2.w),
Container(
color: Colors.grey.withOpacity(0.1),
padding: const EdgeInsets.all(8.0),
height: 20.h,
width: 40.w,
child: InkWell(
onTap: () {
print('children');
},
child: Column(
children: [
Image(
height: 15.h,
width: 40.w,
image: const AssetImage(
'images/child shopping.jpg'),
fit: BoxFit.fitWidth,
),
Text(
'children',
style: TextStyle(
fontWeight:
FontWeight.bold,
fontSize: 15.sp),
),
],
),
),
),
SizedBox(width: 2.w),
],
),
),*/
