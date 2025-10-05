class CountryCodeToEmoji {
  static String countryCodeToEmoji({required String countryCode}) {
    final code = countryCode.toUpperCase();
    return code.runes.map((int value) {
      return String.fromCharCode(value + 127397);
    }).join();
  }
}
