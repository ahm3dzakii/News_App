import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/shared/local/cache_helper.dart';
import 'package:news_app/shared/network/dio_helper.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit():super(AppInitialState());
  static AppCubit get(BuildContext context)=> BlocProvider.of(context);

  List businessList = [];
  List sportsList = [];
  List scienceList = [];
  List technologyList = [];
  List entertainmentList = [];
  List generalList = [];
  List healthList = [];
  int currentIndex = 0;
  bool isDark = false;
  // String country = 'eg';

  void getBusinessNews() {
    // https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=f92957e9134242d386c6b54bf2c31b0a
    emit(GetBusinessNewsLoadingState());
    DioHelper.getData(url: 'top-headlines', queryParameters: {
      'country':'eg',
      'category':'business',
      'apiKey':'f92957e9134242d386c6b54bf2c31b0a'
    }).then((value) {
      businessList = value.data['articles'];
      emit(GetBusinessNewsSuccessState());
    }).catchError((error) {
      emit(GetBusinessNewsErrorState());
    });
  }
  void getSportsNews() {
    // https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=f92957e9134242d386c6b54bf2c31b0a
    emit(GetSportsNewsLoadingState());
    DioHelper.getData(url: 'top-headlines', queryParameters: {
      'country':'eg',
      'category':'sports',
      'apiKey':'f92957e9134242d386c6b54bf2c31b0a'
    }).then((value) {
      sportsList = value.data['articles'];
      emit(GetSportsNewsSuccessState());
    }).catchError((error) {
      emit(GetSportsNewsErrorState());
    });
  }
  void getScienceNews() {
    // https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=f92957e9134242d386c6b54bf2c31b0a
    emit(GetScienceNewsLoadingState());
    DioHelper.getData(url: 'top-headlines', queryParameters: {
      'country':'eg',
      'category':'science',
      'apiKey':'f92957e9134242d386c6b54bf2c31b0a'
    }).then((value) {
      scienceList = value.data['articles'];
      emit(GetScienceNewsSuccessState());
    }).catchError((error) {
      emit(GetScienceNewsErrorState());
    });
  }
  void getTechnologyNews() {
    // https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=f92957e9134242d386c6b54bf2c31b0a
    emit(GetTechnologyNewsLoadingState());
    DioHelper.getData(url: 'top-headlines', queryParameters: {
      'country':'eg',
      'category':'technology',
      'apiKey':'f92957e9134242d386c6b54bf2c31b0a'
    }).then((value) {
      technologyList = value.data['articles'];
      emit(GetTechnologyNewsSuccessState());
    }).catchError((error) {
      emit(GetTechnologyNewsErrorState());
    });
  }
  void getEntertainmentNews() {
    // https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=f92957e9134242d386c6b54bf2c31b0a
    emit(GetEntertainmentNewsLoadingState());
    DioHelper.getData(url: 'top-headlines', queryParameters: {
      'country':'eg',
      'category':'entertainment',
      'apiKey':'f92957e9134242d386c6b54bf2c31b0a'
    }).then((value) {
      entertainmentList = value.data['articles'];
      emit(GetEntertainmentNewsSuccessState());
    }).catchError((error) {
      emit(GetEntertainmentNewsErrorState());
    });
  }
  void getGeneralNews() {
    // https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=f92957e9134242d386c6b54bf2c31b0a
    emit(GetGeneralNewsLoadingState());
    DioHelper.getData(url: 'top-headlines', queryParameters: {
      'country':'eg',
      'category':'general',
      'apiKey':'f92957e9134242d386c6b54bf2c31b0a'
    }).then((value) {
      generalList = value.data['articles'];
      emit(GetGeneralNewsSuccessState());
    }).catchError((error) {
      emit(GetGeneralNewsErrorState());
    });
  }
  void getHealthNews() {
    // https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=f92957e9134242d386c6b54bf2c31b0a
    emit(GetHealthNewsLoadingState());
    DioHelper.getData(url: 'top-headlines', queryParameters: {
      'country':'eg',
      'category':'health',
      'apiKey':'f92957e9134242d386c6b54bf2c31b0a'
    }).then((value) {
      healthList = value.data['articles'];
      emit(GetHealthNewsSuccessState());
    }).catchError((error) {
      emit(GetHealthNewsErrorState());
    });
  }
  void setCurrentIndex(int index) {
    currentIndex = index;
    emit(SetCurrentIndexState());
  }
  void changeMood({bool? fromShared}) {
    if(fromShared == null) {
      isDark = !isDark;
      CacheHelper.saveData(key: 'isDark', value: isDark);
    }
    else {
      isDark = fromShared;
    }
    emit(ChangeMoodState());
  }
  // changeCountry(String value) {
  //   country = value;
  //   emit(ChangeCountryState());
  // }

}