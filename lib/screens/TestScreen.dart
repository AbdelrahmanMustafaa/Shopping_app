import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/reusable/my_colors.dart';
import 'package:sizer/sizer.dart';
import '../../app_cubit/app_cubit.dart';
import '../../app_cubit/app_state.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  void initState() {
    BlocProvider.of<AppCubit>(context).getData();
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = BlocProvider.of<AppCubit>(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: myLightBlack,
            ),
            body: Container(
              padding: EdgeInsets.all(8),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                   /* child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                        height: 10,
                      ),
                      shrinkWrap: true,
                      itemCount: 2,
                        itemBuilder: (context , index){
                      return Container(
                        width: 80.w,
                        height: 10.h,
                        child: MaterialButton(
                          color: Colors.yellow,
                          onPressed: () {},
                          child: Text(
                            '${cubit.s}',
                            style: TextStyle(fontSize: 26.sp),
                          ),
                        ),
                      );
                    }),*/
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
