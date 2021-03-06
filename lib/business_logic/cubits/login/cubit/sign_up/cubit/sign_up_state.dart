part of 'sign_up_cubit.dart';

class SignUpState extends Equatable {
  const SignUpState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.name = const Name.pure(),
    this.status = FormzStatus.pure,
    this.exceptionError = "",
    this.snackbarmessage = "",
  });
  final Email email;
  final Name name;
  final Password password;
  final FormzStatus status;
  final String exceptionError;
  final String snackbarmessage;

  @override
  List<Object> get props => [email, name, password, status, exceptionError];

  SignUpState copyWith(
      {Email? email,
      Name? name,
      Password? password,
      FormzStatus? status,
      String? exceptionError,
      String? snackbarmessage}) {
    return SignUpState(
      email: email ?? this.email,
      name: name ?? this.name,
      password: password ?? this.password,
      status: status ?? this.status,
      exceptionError: exceptionError ?? this.exceptionError,
      snackbarmessage: snackbarmessage ?? this.snackbarmessage,
    );
  }
}
