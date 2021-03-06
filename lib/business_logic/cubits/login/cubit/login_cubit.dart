import 'dart:core';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_oauth/firebase_auth_oauth.dart';
import 'package:flutter/services.dart';
import 'package:formz/formz.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:the_ultimate_todo/Data/Provider/daily_todo_api_db.dart';

import 'package:the_ultimate_todo/services/models/authentication/email.dart';
import 'package:the_ultimate_todo/services/models/authentication/password.dart';
import 'package:the_ultimate_todo/services/models/tasks/daily_tasks.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([email, state.password]),
    ));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
        password: password, status: Formz.validate([state.email, password])));
  }

  Future<void> performLogin(String provider, List<String> scopes,
      Map<String, String> parameters) async {
    try {
      await FirebaseAuthOAuth().openSignInFlow(provider, scopes, parameters);
    } on PlatformException catch (error) {
      emit(state.copyWith(exceptionError: error.toString()));
    }
  }

  Future<void> logInWithCredentials() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await _auth.signInWithEmailAndPassword(
          email: state.email.value, password: state.password.value);
      print(FirebaseAuth.instance.currentUser);
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(
          status: FormzStatus.submissionFailure, exceptionError: e.message));
    }
    // Stream<List<DailyTasks>> getDailyTodos() =>
    //     DailyTodoApiDb().getDailyTasks();
  }

  Future signInWithGoogle() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) {
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      });
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(
          status: FormzStatus.submissionFailure, exceptionError: e.message));
    }
  }

  Future<void> signOut() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      return await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(
          status: FormzStatus.submissionFailure, exceptionError: e.message));
    }
  }
}
