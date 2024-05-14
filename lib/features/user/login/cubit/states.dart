import 'package:watch_it/features/user/login/model/request_token_model.dart';


abstract class AppStates{}

class AppInitialState extends AppStates{}

class AppChangeLoginVisibilityState extends AppStates{}

class AppLoadingState extends AppStates{}
class AppSuccessState extends AppStates{}
class AppErrorState extends AppStates{
  final String? error;

  AppErrorState(this.error);
}

class AppLoginLoadingState extends AppStates{}
class AppLoginSuccessState extends AppStates{
  final RequestTokenModel requestTokenModel;

  AppLoginSuccessState(this.requestTokenModel);
}
class AppLoginErrorState extends AppStates{
  final String error;
  AppLoginErrorState(this.error);
}