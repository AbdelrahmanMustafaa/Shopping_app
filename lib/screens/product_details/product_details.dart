import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopping_app/app_cubit/app_cubit.dart';
import 'package:shopping_app/app_cubit/app_state.dart';
import 'package:shopping_app/reusable/my_colors.dart';
import 'package:sizer/sizer.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = BlocProvider.of<AppCubit>(context);
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                print('Add to cart');
              },
              child: const Icon(Icons.add_shopping_cart),
              backgroundColor: myLightBlack,
            ),
            body: SafeArea(
              child: Container(
                height: 100.h,
                width: 100.w,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'images/pattern white background .png',
                      ),
                      fit: BoxFit.fill),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.arrow_back_rounded,
                                  size: 30,
                                ),
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              Text(
                                'Details',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.sp),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.shopping_cart),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 5.h,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              width: 100.w,
                              height: 40.h,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        cubit.changeHeartIcon();
                                      },
                                      icon: cubit.isLiked == false
                                          ? cubit.emptyHeart
                                          : cubit.fillHeart,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 40, right: 20, top: 20, bottom: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Product Name',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 24.sp),
                                      ),
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.only(
                                                  top: 8,
                                                  left: 12,
                                                  right: 12,
                                                  bottom: 8),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: myLightBlack),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    '5',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18.sp),
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.white,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Text(
                                    'Brand:',
                                    style: TextStyle(fontSize: 18.sp),
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'EGP 100.0',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 24.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Text(
                                        ' EGP 120.0 ',
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            decoration:
                                                TextDecoration.lineThrough),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  Text(
                                    'Colors:',
                                    style: TextStyle(fontSize: 16.sp),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(2),
                                        height: 5.h,
                                        width: 12.w,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: myLightBlack, width: 2),
                                        ),
                                        child: CircleAvatar(
                                          backgroundColor: Colors.green,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(2),
                                        height: 5.h,
                                        width: 12.w,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: myLightBlack, width: 2),
                                        ),
                                        child: CircleAvatar(
                                          backgroundColor:
                                              Colors.lightBlueAccent,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Text(
                                    'Quantity:',
                                    style: TextStyle(fontSize: 16.sp),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Container(
                                    width: 30.w,
                                    height: 5.h,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.8),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              print('decrease');
                                              cubit.decreaseQuantity();
                                            },
                                            icon: Icon(Icons.remove)),
                                        Text(
                                          '${cubit.quantity}',
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              cubit.increaseQuantity();
                                              print(' increase');
                                            },
                                            icon: Icon(Icons.add))
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Description:',
                                        style: TextStyle(fontSize: 16.sp),
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      ListView.separated(
                                        separatorBuilder: (context, index) =>
                                            Divider(),
                                        shrinkWrap: true,
                                        itemCount: 5,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return Row(
                                            children: [
                                              Container(
                                                height: 1.h,
                                                width: 2.w,
                                                decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              Text(
                                                'Description : blablablabla',
                                                style: TextStyle(),
                                              )
                                            ],
                                          );
                                        },
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
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
