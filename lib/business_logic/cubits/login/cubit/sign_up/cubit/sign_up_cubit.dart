import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:formz/formz.dart';
import 'package:the_ultimate_todo/data/models/authentication/email.dart';
import 'package:the_ultimate_todo/data/models/authentication/name.dart';
import 'package:the_ultimate_todo/data/models/authentication/password.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(const SignUpState());

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
        email: email,
        status: Formz.validate([state.name, email, state.password])));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([state.name, state.email, password]),
    ));
  }

  void nameChanged(String value) {
    final name = Name.dirty(value);
    emit(state.copyWith(
        name: name,
        status: Formz.validate([name, state.email, state.password])));
  }

  Future<void> signUpWithCredentials() async {
    // if (!state.status.isValidated) return;
    // emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      final FirebaseAuth = await Future.delayed(Duration(milliseconds: 500));
      _auth.createUserWithEmailAndPassword(
          email: state.email.value, password: state.password.value);
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on FirebaseAuthException catch (e) {
      print(e.message);
      emit(state.copyWith(
          status: FormzStatus.submissionFailure, exceptionError: e.message));
    }
  }
}
