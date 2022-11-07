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
    BlocProvider.of<AppCubit>(context).getChildrenData();
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
          List? price = [];
          List? keys = cubit.childAllData.first.keys.toList();
          List? name = keys;
          List? data = cubit.childAllData.first.values.toList();
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      // print('values : *************** $values *************');
                      print('keys : *************** $name *************');
                      data.forEach((element) {
                        print('Element **********************');
                        print(element);
                        element.forEach((element) {
                          print('Element 2 **********************');
                          print(element ['price'] );
                          price.add(element['price']);
                          print ('price : $price');
                        });
                      });
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
                  Container(
                    height: 20.h,
                    child: Row(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: keys.length,
                          itemBuilder: (context, index) {
                            return Container(
                              color: Colors.grey.withOpacity(0.5),
                              margin: EdgeInsets.all(20),
                              child: Center(
                                child: Text(
                                  '${keys[index]}',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
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
                                      image:
                                          AssetImage('images/red T shirt.png'),
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
                                              '${keys[index]}',
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
                                              '${price}\$',
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
