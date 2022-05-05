import 'package:ecommerce_bloc/Screens/login/login_screen.dart';
import 'package:ecommerce_bloc/cubit/cubit.dart';
import 'package:ecommerce_bloc/layout/home_screen.dart';
import 'package:ecommerce_bloc/network/cache_helper.dart';
import 'package:ecommerce_bloc/network/dio_helper.dart';
import 'package:ecommerce_bloc/shared/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'shared/componnetns/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();

  Widget widget;

  bool onBoarding = CacheHelper.getData(key: 'onBoarding');

  token = CacheHelper.getData(key: 'token');

  // if(onBoarding != null)

  if (token != null) {
    widget = HomeScreen();
  } else {
    widget = LoginScreen();
  }

  runApp(Myapp(
    startWidget: widget,
  ));
}

class Myapp extends StatelessWidget {
  final Widget startWidget;

  Myapp({
    this.startWidget,
  });
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => MainCubit()
              ..getHomeData()
              ..getCategoriesData()
              ..getFavoritesData()
              ..getUserData()
              ..getCartData()),
      ],
      child: MaterialApp(
        theme: lightTheme,
        debugShowCheckedModeBanner: false,
        home: startWidget,
      ),
    );
  }
}
