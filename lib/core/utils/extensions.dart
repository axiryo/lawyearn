extension StringExtensions on String {
  String getFirstLetterCapitalized() {
    if (isEmpty) {
      return '';
    } else {
      return this[0].toUpperCase();
    }
  }
}
