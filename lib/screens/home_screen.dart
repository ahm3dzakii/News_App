import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/screens/business_screen.dart';
import 'package:news_app/screens/entertainment_screen.dart';
import 'package:news_app/screens/general_screen.dart';
import 'package:news_app/screens/health_screen.dart';
import 'package:news_app/screens/science_screen.dart';
import 'package:news_app/screens/sports_screen.dart';
import 'package:news_app/screens/technology_screen.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);

  List <Widget> screens = [
    const GeneralScreen(),
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
    const TechnologyScreen(),
    const EntertainmentScreen(),
    const HealthScreen()
  ];
  List <String> titles = [
    'General',
    'Business',
    'Sports',
    'Science',
    'Technology',
    'Entertainment',
    'Health'
  ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer <AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              titles[AppCubit.get(context).currentIndex],
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    AppCubit.get(context).changeMood();
                  },
                  icon: Icon(
                    Icons.dark_mode,
                    color: AppCubit.get(context).isDark?Colors.white : const Color(0xff343434),
                  ),
              ),
              // DropdownButtonHideUnderline(
              //   child: DropdownButton(
              //     hint: const Text('Country'),
              //     items: ['us', 'eg']
              //         .map((String value) {
              //           return DropdownMenuItem<String>(
              //             value: value,
              //             child: Text(value),
              //           );
              //         },
              //     ).toList(),
              //     onChanged: (value) {
              //       print(value);
              //       AppCubit.get(context).changeCountry(value as String);
              //       print(AppCubit.get(context).changeCountry(value as String));
              //     },
              //
              //   ),
              // ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (int index) {
              AppCubit.get(context).setCurrentIndex(index);
            },
            currentIndex: AppCubit.get(context).currentIndex,
            type: BottomNavigationBarType.fixed,

            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.border_all_sharp,),label: 'General'),
              BottomNavigationBarItem(icon: Icon(Icons.business_sharp),label: 'Business'),
              BottomNavigationBarItem(icon: Icon(Icons.sports_football_sharp),label: 'Sports'),
              BottomNavigationBarItem(icon: Icon(Icons.science_sharp),label: 'Science'),
              BottomNavigationBarItem(icon: Icon(Icons.computer_sharp),label: 'Technology'),
              BottomNavigationBarItem(icon: Icon(Icons.recent_actors_sharp),label: 'Entertainment'),
              BottomNavigationBarItem(icon: Icon(Icons.health_and_safety_sharp),label: 'Health'),
            ],
          ),
          body: screens[AppCubit.get(context).currentIndex],
        );
      },
    );
  }
}
