import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/Database/modelConstant.dart';
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
    super.initState();
    BlocProvider.of<AppCubit>(context).getCData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = BlocProvider.of<AppCubit>(context);
          List images = [];

          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      images = cubit.image;
                      print(images.first.runtimeType);
                      print(cubit.id);
                    },
                    icon: const Icon(Icons.print))
              ],
              backgroundColor: myLightBlack,
              //  title: Text('${cubit.childAllData.first.keys.toList()}'),
            ),
            body: SafeArea(
              minimum: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
              child: Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              childAspectRatio: 0.55),
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 80.h,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: cubit.CImages!.isEmpty
                                          ? NetworkImage('')
                                          : NetworkImage(
                                              '${cubit.ppp!.toList()[index]}'),
                                      // NetworkImage('${cubit.CImages!.toList()[index]}'),
                                      fit: BoxFit.fill,
                                    ),
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              Container(
                                height: 0.1.h,
                                width: double.infinity,
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  width: double.infinity,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              '${cubit.keys![index]}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: myDarkBLue,
                                                fontSize: 14.sp,
                                              ),
                                            ),
                                          ),
                                          const Icon(
                                            Icons.favorite_border,
                                            color: Colors.black,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              '${cubit.price![index]}\$',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: myDarkBLue,
                                                fontSize: 14.sp,
                                              ),
                                            ),
                                          ),
                                          const Icon(
                                            Icons.add_shopping_cart,
                                            color: Colors.black,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
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
