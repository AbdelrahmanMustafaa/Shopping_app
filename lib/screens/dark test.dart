import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app_cubit/app_cubit.dart';
import '../app_cubit/app_state.dart';

class dark extends StatelessWidget {
  const dark({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = BlocProvider.of(context);
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  onPressed: () {
                    cubit.changDarkMode();
                  },
                  icon: Icon(Icons.factory),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
