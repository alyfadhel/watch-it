import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_it/features/user/login/cubit/states.dart';
import 'package:watch_it/features/user/login/model/request_token_model.dart';
import 'package:watch_it/features/user/network/remote/dio_helper.dart';



class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  var userNameController = TextEditingController();
  var passwordController = TextEditingController();
  var tokenController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  bool isPassword = true;
  IconData suffix = Icons.visibility_off_outlined;

  void changeLoginVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(AppChangeLoginVisibilityState());
  }

  RequestTokenModel? model;

  void getToken() {
    emit(AppLoadingState());
    DioHelper.getData(
      url: 'authentication/token/new',
    ).then(
      (value) {
        model = RequestTokenModel.fromJson(value.data);
        emit(AppSuccessState());
        debugPrint(value.data.toString());
      },
    ).catchError(
      (error) {
        emit(AppErrorState(error.toString()));
        debugPrint(error.toString());
      },
    );
  }

  void getUser({
    required String username,
    required String password,
    required String? token,
  }) {
    emit(AppLoginLoadingState());
    DioHelper.postData(
      url: 'authentication/token/validate_with_login',
      data: {
        'username': username,
        'password': password,
        'request_token' : token??'' ,
      },
    )
        .then(
          (value) {
            model = RequestTokenModel.fromJson(value.data);
            emit(AppLoginSuccessState(model!));
            debugPrint('Login User: ${value.data.toString()}');
          },
        )
        .catchError(
          (error) {
            emit(AppLoginErrorState(error.toString()));
            debugPrint(error.toString());
          },
        );
  }
}
