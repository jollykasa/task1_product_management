class FormValidator {
  static String? validateEmail(String? val) {
    if (val == null) {
      return "Email Cannot be empty";
    } else if (val.isEmpty) {
      return "Email Cannot be empty";
    }
    if (RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(val)) {
      return null;
    } else {
      return 'please enter valid email address';
    }
  }

  static String? validateFieldNotEmpty(String? val, String fieldName) {
    if (val == null) {
      return "$fieldName cannot be empty.";
    } else if (val.isEmpty) {
      return "$fieldName cannot be empty.";
    } else {
      return null;
    }
  }

  static String? isMatchPassword(String? val, String? confirmPl) {
    if (confirmPl == null || confirmPl == "") {
      return "Confirm Password cannot be empty";
    } else if (confirmPl.isEmpty) {
      return "Confirm Password cannot be empty";
    } else {
      if (val == confirmPl) {
        return null;
      } else {
        return "Confirm Password and Password does not match";
      }
    }
  }

  static String? validatePassword(String? val, String fieldName) {
    if (val == null) {
      return "$fieldName cannot be empty.";
    } else if (val.isEmpty) {
      return "$fieldName cannot be empty.";
    } else if ((val.length)! < 4) {
      return "$fieldName must be at least 4 characters long";
    } else {
      return null;
    }
  }
}
