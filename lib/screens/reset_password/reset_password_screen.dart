import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/reusable/my_colors.dart';
import 'package:sizer/sizer.dart';
import '../../app_cubit/app_cubit.dart';
import '../../app_cubit/app_state.dart';

class Reset_Password extends StatelessWidget {
  const Reset_Password({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = BlocProvider.of<AppCubit>(context);
          var EmailText = TextEditingController();
          return Scaffold(
            appBar: AppBar(
              backgroundColor: myLightBlack,
            ),
            body: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image:
                          AssetImage('images/pattern white background .png'))),
              child: Padding(
                padding: EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
                child: Column(
                  children: [
                    TextFormField(
                      controller: EmailText,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    TextButton(
                      onPressed: () {
                        cubit.forgetPassword(EmailText , context);
                      },
                      child: Text('reset'),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
