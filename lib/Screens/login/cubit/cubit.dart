import 'package:bloc/bloc.dart';
import 'package:ecommerce_bloc/Screens/login/cubit/state.dart';
import 'package:ecommerce_bloc/model/login/login_model.dart';
import 'package:ecommerce_bloc/network/End_Points.dart';
import 'package:ecommerce_bloc/network/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class loginCubit extends Cubit<LoginState> {
  loginCubit() : super(LoginInitialState());
  static loginCubit get(context) => BlocProvider.of(context);

  LoginModel loginModel;

  void UserLogin({@required String email, @required String password}) {
    emit(LoginLoadingState());
    DioHelper.postData(
      url: LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      emit(LoginSuccessState(loginModel));
    }).catchError((error) {
      emit(LoginErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void ChangePassword()
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(ChangePasswordState());
  }
}
