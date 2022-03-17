class Validator {
  static bool isValidEmail(String input) {
    final RegExp regex = new RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    return regex.hasMatch(input);
  }
}
