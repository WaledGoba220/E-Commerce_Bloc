import 'package:ecommerce_bloc/model/login/login_model.dart';
import 'package:flutter/material.dart';


abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final LoginModel  loginModel;

  LoginSuccessState(this.loginModel);
}

class LoginErrorState extends LoginState {
  final String error;

  LoginErrorState( this.error);
}

class ChangePasswordState extends LoginState {}
