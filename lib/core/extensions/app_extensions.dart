extension StringExtensions on String {
  String removeExtraSpace() {
    return replaceAll('  ', ' ');
  }

  String removePrefixSpecialChars() {
    final prefixRegex = RegExp(r'^[<>=\s]+'); // Matches <, >, =, space at the start
    return replaceFirst(prefixRegex, '');
  }
}
