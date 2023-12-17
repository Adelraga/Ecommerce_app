import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> loginUser(
      {required String email, required String password}) async {
    emit(LoginLoading());

    try {
      var auth = FirebaseAuth.instance;
      // ignore: unused_local_variable
      UserCredential user = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailure(errMessage: 'User not found'));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailure(errMessage: 'Wrong Password'));
      }
      else if(e.code == 'INVALID_LOGIN_CREDENTIALS'){
        emit(LoginFailure(errMessage: 'email not exist Sign Up First'));
      }
    } on Exception catch (e) {
      emit(LoginFailure(errMessage: e.toString()));
    }
  }
}
