import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/loadings/loadings.dart';
import 'package:store/nested_utils/childless_assertion.dart';
import 'package:store/presentation/home/blocs/app_cubit.dart';
import 'package:store/presentation/home/blocs/app_state.dart';
import 'package:store/presentation/splash/blocs/splash_cubit.dart';
import 'package:store/presentation/splash/blocs/splash_state.dart';

class AppBlocsInject extends SingleChildStatelessWidget
    with ChildlessAssertion {
  const AppBlocsInject({
    Key? key,
    Widget? child,
  }) : super(
          key: key,
          child: child,
        );

  @override
  Widget buildWithNoneNullChild(BuildContext context, Widget child) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SplashCubit>(
          create: (context) {
            return SplashCubit(
              initialState: const SplashState(),
              loadingManager: context.read<LoadingManager>(),
            );
          },
        ),
        BlocProvider<AppProgressCubit>(
          create: (context) {
            return AppProgressCubit(
              initialState: const AppProgressState(),
              loadingManager: context.read<LoadingManager>(),
            );
          },
        ),
      ],
      child: child,
    );
  }
}
