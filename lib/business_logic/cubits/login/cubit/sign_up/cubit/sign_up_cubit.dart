import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:formz/formz.dart';
import 'package:the_ultimate_todo/services/models/authentication/email.dart';
import 'package:the_ultimate_todo/services/models/authentication/name.dart';
import 'package:the_ultimate_todo/services/models/authentication/password.dart';
import 'package:the_ultimate_todo/Data/Repository/create_db.dart';

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
    try {
      final FirebaseAuth = await Future.delayed(Duration(milliseconds: 500));
      _auth.createUserWithEmailAndPassword(
          email: state.email.value, password: state.password.value);
      emit(state.copyWith(status: FormzStatus.submissionSuccess));

      // print(state.name.value + "Name in signup...");
      // _auth.currentUser!.updateDisplayName(state.name.value);

      // createUserInDatabase(_auth);

    } on PlatformException catch (e) {
      print(e.code);
      if (e.code == 'auth/email-already-in-use') {
        emit(state.copyWith(
            status: FormzStatus.submissionFailure,
            snackbarmessage: "Email already taken use another email"));
      }
    }
  }
}
