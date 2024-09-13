bool isValidDouble(String input) {
  try {
    double.parse(input);
    return true;
  } catch (e) {
    return false;
  }
}
