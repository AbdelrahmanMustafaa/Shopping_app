import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/app_cubit/app_cubit.dart';
import 'package:shopping_app/app_cubit/app_state.dart';

class fuck extends StatefulWidget {
  const fuck({Key? key}) : super(key: key);

  @override
  State<fuck> createState() => _fuckState();
}

class _fuckState extends State<fuck> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AppCubit>(context).getChildrenImage();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
         var cubit = BlocProvider.of<AppCubit>(context);
          return state.runtimeType  ==  GetChildImageSuccessState ?  Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    cubit.childrenImages!),
              ),
            ),
          ) : Container(
            child: Center (
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          ) ;
        },
      ),
    );
  }
}
