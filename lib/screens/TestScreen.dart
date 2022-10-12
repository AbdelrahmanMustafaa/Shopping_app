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
          Future? f;
          AppCubit cubit = BlocProvider.of<AppCubit>(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: myLightBlack,
            ),
            body: FutureBuilder(
              future: f,
              builder: (context, snapshot) => state.runtimeType ==
                      GetDataErrorState
                  ? Text('Error')
                  : state.runtimeType == GetDataSuccessState
                      ? Container(
                          padding: EdgeInsets.all(8),
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: GridView.builder(
                                  shrinkWrap: true,
                                  itemCount: cubit.childAllData.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10,
                                    childAspectRatio: 1,
                                  ),
                                  itemBuilder: (context, index) =>  Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                    cubit.images[index],
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    cubit.childAllData[index]
                                                        .keys.first,
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    cubit.childAllData[index]
                                                        .keys
                                                        .toString(),
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )

                                ),
                              ),
                            ],
                          ),
                        )
                      : state.runtimeType == GetDataLoadingState
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : Container(
                              color: Colors.black,
                            ),
            ),
          );
        },
      ),
    );
  }
}
