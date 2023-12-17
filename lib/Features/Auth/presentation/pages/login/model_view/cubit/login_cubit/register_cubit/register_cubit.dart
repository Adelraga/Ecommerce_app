import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  Future<void> registeruser(
      {required String email, required String password}) async {
    emit(RegisterLoading());

    try {
      var auth = FirebaseAuth.instance;
      // ignore: unused_local_variable
      UserCredential user = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(RegisterFailure(errMessage: 'User not found'));
      } else if (e.code == 'wrong-password') {
        emit(RegisterFailure(errMessage: 'Wrong Password'));
      } else {
        emit(RegisterFailure(
            errMessage:
                'The email address is already in use by another account'));
      }
    } on Exception catch (e) {
      emit(RegisterFailure(errMessage: e.toString()));
    }
  }
}
