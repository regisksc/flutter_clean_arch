abstract class URL {
  /// API BASE URL
  // static const String base = 'https://apiapp-homol-dot-pandapay.rj.r.appspot.com/app';
  static const String base = 'http://18.111.11.111:8080/app';

  /// getter to make calling the endpoint easier
  // ignore: always_declare_return_types
  static String endpoint(String endpoint) => "$base/${endpoint ?? ""}";
}
