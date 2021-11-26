import 'package:formz/formz.dart';

enum EmailValidatorError { invalid }

class Email extends FormzInput<String, EmailValidatorError> {
  const Email.pure() : super.pure('');
  const Email.dirty([String value = '']) : super.dirty(value);
  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  @override
  EmailValidatorError? validator(String value) {
    return _emailRegExp.hasMatch(value)
        ? null
        : value.isEmpty
            ? null
            : EmailValidatorError.invalid;
  }
}

extension Explanation on EmailValidatorError {
  String? get email {
    switch (this) {
      case EmailValidatorError.invalid:
        return "This is not a valid email";
      default:
        return null;
    }
  }
}
// Extension method :
/*
    Assume we need to give some extra methods on some 
    external library then one would way would be extend 
    that API and wrap it with our desired class and add required 
    methods.

    class ExoplanetWrapper 
    {
      Exoplanet wrapped ;
      bool get isHabitable => checkHabitable
    }
*/