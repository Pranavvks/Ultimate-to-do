import 'package:formz/formz.dart';

enum PasswordValidationError { invalid, empty }

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');
  const Password.dirty([String value = '']) : super.dirty(value);
  static final _passwordRegExp = RegExp(r'^[A-Za-z\d@$!%*?&]{8,}$');

  @override
  PasswordValidationError? validator(String value) {
    if (value.isEmpty) {
      return PasswordValidationError.empty;
    }
    return _passwordRegExp.hasMatch(value)
        ? null
        : PasswordValidationError.invalid;
  }
}

extension Explanation on PasswordValidationError {
  String? get password {
    switch (this) {
      case PasswordValidationError.invalid:
        return "Invalid condition";
      default:
        return null;
    }
  }
}
/*
Padding(edgeInsets : EdgeInsets.all(8))
100 times -> Memory cluttered. 
cannoical instance -> Multiple objects created 
are going to use the cannoical instance.

final int field1 ;
Not all classes can be constant. For ex : 
What if we wanted a class with future

*/