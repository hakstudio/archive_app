class AccessAuth {
  int? _accessAuth;
  String? _accessAuthName;

  AccessAuth({int accessAuth = -1, String accessAuthName = ""}) {
    _accessAuth = accessAuth;
    _accessAuthName = accessAuthName;
  }

  static List<int> get() {
    return [1, 2, 3, 4, 5, 6, 7, 8, 9];
  }

  int get accessAuth => _accessAuth!;

  String get accessAuthName => _accessAuthName!;

  set accessAuthName(String value) {
    _accessAuthName = value;
  }

  set accessAuth(int value) {
    _accessAuth = value;
  }
}
