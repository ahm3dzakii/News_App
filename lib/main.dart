// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:news_app/shared/local/cache_helper.dart';
import 'package:news_app/shared/local/constants.dart';
import 'package:news_app/shared/network/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  bool isDark = await CacheHelper.getData(key: 'isDark', defaultValue: false);
  runApp(MyApp(isDark: isDark,));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key, required this.isDark}) : super(key: key);
  bool isDark;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()
        ..getBusinessNews()
        ..getScienceNews()
        ..getSportsNews()
        ..getTechnologyNews()
        ..getEntertainmentNews()
        ..getGeneralNews()
        ..getHealthNews()
        ..changeMood(fromShared: isDark),
      child: BlocConsumer <AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: Constants.lightTheme,
            themeMode: AppCubit.get(context).isDark? ThemeMode.dark : ThemeMode.light,
            darkTheme: Constants.darkTheme,
            home: HomeScreen(),
          ),
      ),
    );
  }
}
