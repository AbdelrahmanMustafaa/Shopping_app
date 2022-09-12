import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopping_app/api_model/api_handler.dart';
import 'package:shopping_app/screens/connect_us/connect_us.dart';
import 'package:shopping_app/screens/connect_us/web_view.dart';
import 'package:shopping_app/screens/profile_screen/profile.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/reusable/my_colors.dart';
import '../../../app_cubit/app_cubit.dart';
import '../../../app_cubit/app_state.dart';
import '../../product_details/product_details.dart';
import '../../sign_in_screen/screen/sign_in_screen.dart';
import '../../sign_in_screen/t.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = BlocProvider.of<AppCubit>(context);
          GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

          List w = [
            Cart(
                cubit.cartList ,
                AssetImage(''),
                context ,
                    (){
                  setState(() {
                    cubit.setI(1);
                  });
                }
            ),
            Home(),
            Love(cubit.wishList , AssetImage('') , context , (){
              setState(() {
                cubit.setI(1);
              });
            }),
          ];
          return SafeArea(
            child: DefaultTabController(
              initialIndex: 1,
              length: 3,
              child: Scaffold(
                bottomNavigationBar: CurvedNavigationBar(
                  index: cubit.getI(),
                  onTap: (index) {
                    print('on tab');
                    setState(() {});
                    cubit.setI(index);
                  },
                  buttonBackgroundColor: myLightBlack,
                  color: myLightBlack,
                  backgroundColor: Colors.white,
                  items: [
                    cubit.icons[0],
                    cubit.icons[1],
                    cubit.icons[2],
                  ],
                ),
                key: scaffoldKey,
                backgroundColor: myLightBlack,
                endDrawer: Drawer(
                  backgroundColor: myLightBlack.withOpacity(0.95),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Profile()));
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
                                    setState(() {
                                      cubit.setI(0);
                                      Navigator.pop(context);
                                    });
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
                                    setState(() {
                                      cubit.setI(2);
                                      Navigator.pop(context);
                                    });
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
                                    cubit.signOut(context);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 10.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          WebView1(cubit.whatsApp),
                                    ),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('images/whatsapp.png'),
                                    ),
                                  ),
                                  width: 12.w,
                                  height: 7.h,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          WebView1(cubit.linkedIn),
                                    ),
                                  );
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 8),
                                  height: 7.h,
                                  width: 15.w,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        'images/linkedin-logo.png',
                                      ),
                                    ),
                                  ),
                                ),
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
                                        scaffoldKey.currentState!
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
                      child: w[cubit.getI()],
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
