import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/shared/local/components.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: AppCubit.get(context).sportsList.length,
                  itemBuilder: (context, index) =>Component.buildItem(AppCubit.get(context).sportsList[index], context),
                  physics: const BouncingScrollPhysics(),
                ),
              )
            ],
          );
      },
    );
  }
}
