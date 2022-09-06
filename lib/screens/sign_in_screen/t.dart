import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopping_app/reusable/my_colors.dart';
import 'package:shopping_app/screens/check_out_screen/check_out.dart';
import 'package:sizer/sizer.dart';

Widget Home() {
  return Column(
    children: [
      Expanded(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'images/pattern white background .png',
              ),
              fit: BoxFit.cover,
            ),
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(80),
            ),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: 70.w,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(200),
                                ),
                                child: Icon(
                                  Icons.search,
                                  color: Colors.grey[600],
                                  size: 25,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 20.h,
                              child: ListView.separated(
                                separatorBuilder: (context, index) => SizedBox(
                                  width: 5.w,
                                ),
                                itemCount: 5,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => Container(
                                  color: Colors.black,
                                  width: 40.w,
                                  height: 20.h,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: 30,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Text(
                                'Hello',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.sp),
                              );
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      )
    ],
  );
}

Widget Cart(List cartList, AssetImage productImage, BuildContext context) {
  return Column(
    children: [
      Expanded(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: cartList.isEmpty
                    ? AssetImage(
                        'images/cart background.png',
                      )
                    : AssetImage('images/pattern white background .png')),
          ),
          child: cartList.isEmpty
              ? Container()
              : Container(
                  height: double.infinity,
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                      top: 30, right: 20, left: 20, bottom: 10),
                  child: Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ListView.separated(
                            separatorBuilder: (context, index) => Container(
                              margin: EdgeInsets.all(8),
                              width: double.infinity,
                              height: 2,
                              color: Colors.grey,
                            ),
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: cartList.length,
                            itemBuilder: (context, index) => Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  height: 15.h,
                                  width: 35.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        fit: BoxFit.cover, image: productImage),
                                    color: Colors.grey.withOpacity(0.8),
                                  ),
                                ),
                                SizedBox(
                                  width: 2.h,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Product Name',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.sp),
                                        ),
                                        SizedBox(
                                          width: 8.w,
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            //Add to love Screen from cart Screen
                                            print(
                                                'Add to love Screen from cart Screen');
                                          },
                                          icon: Icon(Iconsax.heart4),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 7.h,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'EGP 0.00',
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              borderRadius:
                                                  BorderRadius.circular(100)),
                                          child: Row(
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                  print('min');
                                                },
                                                icon: Icon(
                                                  Icons.remove,
                                                  size: 20,
                                                ),
                                              ),
                                              Text(
                                                '2',
                                                style: TextStyle(fontSize: 20),
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  print('plus');
                                                },
                                                icon: Icon(
                                                  Icons.add,
                                                  size: 20,
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          // button complete order
                          SizedBox(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    margin: EdgeInsets.only(top: 20, right: 10),
                                    padding: EdgeInsets.all(10),
                                    width: 30.w,
                                    color: myLightBlack,
                                    child: Center(
                                      child: Text(
                                        'EGP 0.0',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.sp),
                                      ),
                                    )),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Check_out(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(top: 20, left: 10),
                                    padding: EdgeInsets.all(10),
                                    width: 30.w,
                                    color: myLightBlack,
                                    child: Center(
                                      child: Text(
                                        'Check Out',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.sp),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
        ),
      ),
    ],
  );
}

Widget Love() {
  return Expanded(
    child: Container(
      color: Colors.blue,
      child: Text('tree'),
    ),
  );
}
