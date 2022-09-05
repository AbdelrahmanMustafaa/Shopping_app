import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/api_model/api_handler.dart';
import 'package:shopping_app/api_model/products_model.dart';
import 'app_cubit/app_cubit.dart';
import 'app_cubit/app_state.dart';

class Test extends StatefulWidget {
  Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  ProductModel? productsModel;

Future getData() async {
  Dio? dio = Dio() ;
    Response response =
        await dio.get('https://fakestoreapi.com/products' ,
         );
    print('status code : ${response.statusCode}');
    print('response : ${response.data.runtimeType}');
  print('0000000000000000000000000000000000000000000');
  productsModel = ProductModel.fromJson(response.data);
    print('0000000000000000000000000000000000000000000');
  }

  @override
  void initState() {
      getData();
    print('-------===================------------------------------');
    print('------------------------------------------------------');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = BlocProvider.of<AppCubit>(context);
          return SafeArea(
            child: Scaffold(
                /*body: FutureBuilder(
              future: cubit.getData(),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Text(cubit.productsModel.id.toString());
                        })
                    : snapshot.hasError
                        ? Text('There are some errors')
                        : ListView.builder(itemBuilder: (context, index) {
                            return Text(cubit.productsModel.id.toString());
                          });
              },
            ),*/
            ),
          );
        },
      ),
    );
  }
}
