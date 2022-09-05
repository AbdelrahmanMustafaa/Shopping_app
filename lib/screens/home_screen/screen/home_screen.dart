import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopping_app/api_model/api_handler.dart';
import 'package:shopping_app/screens/connect_us/connect_us.dart';
import 'package:shopping_app/screens/connect_us/web_view.dart';
import 'package:shopping_app/test.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/reusable/my_colors.dart';
import '../../../app_cubit/app_cubit.dart';
import '../../../app_cubit/app_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    DioHandler.init();
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
          int i = 0;
          return SafeArea(
            child: DefaultTabController(
              initialIndex: i,
              length: 3,
              child: Scaffold(
                bottomNavigationBar: TabBar(
                  tabs: [
                    Tab(
                      icon: Icon(Icons.factory),
                    ),
                    Tab(
                      icon: Icon(Icons.shopping_cart),

                    ),
                    Tab(
                      icon: Icon(Icons.person_add),

                    )
                  ],
                ),
                key: cubit.scaffoldKey,
                backgroundColor: myLightBlack,
                endDrawer: Drawer(
                  backgroundColor: myLightBlack.withOpacity(0.95),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  // navigate to profile page
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 35,
                                      child: Icon(
                                        Icons.person,
                                        size: 40,
                                        color: myLightBlack,
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Text(
                                            'Profile Name',
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                          Text(
                                            'Email@Email.com',
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              ListTile(
                                title: Text(
                                  'My Orders',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.sp),
                                ),
                                leading: Icon(
                                  Icons.shopping_cart,
                                  color: Colors.grey,
                                ),
                                onTap: () {
                                  // navegate to cart
                                  print('Cart Screen');
                                },
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              ListTile(
                                title: Text(
                                  'My Wish List',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.sp),
                                ),
                                leading: Icon(
                                  Iconsax.heart5,
                                  color: Colors.grey,
                                ),
                                onTap: () {
                                  // navegate to wish list
                                  print('Wish List');
                                },
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              ListTile(
                                title: Text(
                                  'Settings',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.sp),
                                ),
                                leading: Icon(
                                  Icons.settings,
                                  color: Colors.grey,
                                ),
                                onTap: () {
                                  print('connect us');
                                },
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              ListTile(
                                title: Text(
                                  'Log out',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.sp),
                                ),
                                leading: Icon(
                                  Icons.arrow_back_rounded,
                                  color: Colors.grey,
                                ),
                                onTap: () {
                                  // log out
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          width: double.infinity,
                          height: 10.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return Connect_Us();
                                      },
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Icons.wechat_outlined,
                                  color: Colors.white,
                                  size: 50,
                                ),
                              ),
                              MaterialButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return WebView1(cubit.linkedIn);
                                      },
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.all(16),
                                  decoration:
                                      BoxDecoration(color: Colors.blueAccent),
                                  child: Text(
                                    'in',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14.sp),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage('images/whatsapp.png'))),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                body: Column(
                  children: [
                    Container(
                      height: 8.h,
                      padding: const EdgeInsets.only(left: 5),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image(
                              height: 20.h,
                              width: 20.w,
                              image: const AssetImage('images/logo .png'),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(100),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15.0),
                                    child: IconButton(
                                      onPressed: () {
                                        cubit.scaffoldKey.currentState!
                                            .openEndDrawer();
                                      },
                                      icon: Icon(
                                        Icons.menu,
                                        color: myLightBlack,
                                        size: 40,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          Column(
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.grey
                                                      .withOpacity(0.4),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                width: 70.w,
                                                child: TextFormField(
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    suffixIcon: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      200),
                                                        ),
                                                        child: Icon(
                                                          Icons.search,
                                                          color:
                                                              Colors.grey[600],
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
                                                        separatorBuilder:
                                                            (context, index) =>
                                                                SizedBox(
                                                          width: 5.w,
                                                        ),
                                                        itemCount: 5,
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        itemBuilder:
                                                            (context, index) =>
                                                                Container(
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
                                                    physics:
                                                        const NeverScrollableScrollPhysics(),
                                                    itemBuilder:
                                                        (context, index) {
                                                      return Text(
                                                        'Hello',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
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
                          ),
                          Expanded(
                              child: Container(
                                  color: Colors.grey, child: Text('Test'))),
                          Expanded(
                              child: Container(
                                  color: Colors.amber, child: Text('Test'))),
                        ],
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
