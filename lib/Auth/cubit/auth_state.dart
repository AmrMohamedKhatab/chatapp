part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class LoginSucces extends AuthState{}
class LoginLoading extends AuthState{}
class LoginFailure extends AuthState{
   String errMassage;
   LoginFailure({required this.errMassage});
}


class RegisterSucces extends AuthState{}
class RegisterLoading extends AuthState{}
class RegisterFailure extends AuthState{
   String errMassage;
   RegisterFailure({required this.errMassage});
}

