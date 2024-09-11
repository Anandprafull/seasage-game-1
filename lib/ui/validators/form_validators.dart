class FormValidators {
  static String? usernameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Username is required";
    }
    return null;
  }
}
