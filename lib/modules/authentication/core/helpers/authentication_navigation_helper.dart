// ignore_for_file: constant_identifier_names

mixin AuthenticationNavigationHelper {
  static const SIGN_IN = '/sign-in';
  static const SIGN_UP = '/sign-up';

  void toSignIn({bool canPop = false}) => to(SIGN_IN, canPop: canPop);
  void toSignUp({bool canPop = false}) => to(SIGN_UP, canPop: canPop);

  void to(String route, {dynamic arguments, bool canPop = false});
}
