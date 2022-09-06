import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/app_cubit/app_cubit.dart';
import 'package:shopping_app/app_cubit/app_state.dart';
import 'package:shopping_app/app_cubit/app_state.dart';
import 'package:shopping_app/reusable/my_colors.dart';
import 'package:sizer/sizer.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit , AppState >(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = BlocProvider.of<AppCubit>(context);
          return Scaffold(
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('images/startup page.png'),
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      height: 25.h,
                      child: SafeArea(
                        child: Row(
                          children: [
                            Container(
                              width: 10.w,
                              child: Column(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(
                                      Icons.arrow_back_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    child: CircleAvatar(
                                      radius: 15.w,
                                      backgroundColor: Colors.white,
                                      child: Icon(
                                        Icons.person,
                                        color: myLightBlack,
                                        size: 25.w,
                                      ),
                                    ),
                                    margin: EdgeInsets.only(right: 10.w),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              'images/pattern white background .png'),
                        ),
                      ),
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(50.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Text(
                                'Profile',
                                style: TextStyle(
                                    fontSize: 30.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 30),
                                child: TextFormField(
                                  enabled: cubit.enabled,
                                  decoration:
                                  InputDecoration(labelText: 'First Name'),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 30),
                                child: TextFormField(
                                  enabled: cubit.enabled,
                                  decoration: InputDecoration(
                                      labelText: 'last Name'),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 30),
                                child: TextFormField(
                                  enabled: cubit.enabled,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                      labelText: 'Email'),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 70.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                            enabled: false,
                                            hintText: '+20',
                                            hintStyle: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Expanded(
                                      flex: 8,
                                      child: TextFormField(
                                        enabled: cubit.enabled,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          labelText: 'phone number',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: InkWell(
                                      onTap: () {
                                       cubit.changeToEnabled();
                                      },
                                      child: Container(
                                        height: 5.h,
                                        decoration: BoxDecoration(
                                          color: myLightBlack,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(7),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Edit',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: InkWell(
                                      onTap: () {
                                        //save data in firebase
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        height: 5.h,
                                        decoration: BoxDecoration(
                                          color: myLightBlack,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(7),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Save',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
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
