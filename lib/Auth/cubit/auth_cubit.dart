import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  
 Future<void> loginUser({required String email,required String password}) async {
         emit(LoginLoading());
    try {
  UserCredential user =await FirebaseAuth.instance
  .signInWithEmailAndPassword(
    email: email, password: password);
    emit(LoginSucces());
}  on FirebaseAuthException catch (ex) {
                          if (ex.code == 'user_not_found') {
                            emit(LoginFailure(errMassage: 'user_not found'));
                          } else if (ex.code == 'wrong_password') {
                            emit(LoginFailure(errMassage: 'worng password'));
                          }
                        } catch (e) {
  emit(LoginFailure(errMassage: 'something went worng')); 
}
  }


  
 Future<void> registerUser({required String email,required String password}) async {
         emit(RegisterLoading());
    try {
  UserCredential user =await FirebaseAuth.instance
  .signInWithEmailAndPassword(
    email: email, password: password);
    emit(RegisterSucces());
}  on FirebaseAuthException catch (ex) {
                          if (ex.code == 'user_not_found') {
                            emit(RegisterFailure(errMassage: 'user_not found'));
                          } else if (ex.code == 'wrong_password') {
                            emit(RegisterFailure(errMassage: 'worng password'));
                          }
                        } catch (e) {
  emit(RegisterFailure(errMassage: 'something went worng')); 
}
}
}
