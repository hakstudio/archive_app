class User {
  int _tc = -1;
  String _name = "";
  String _surname = "";
  int _accessAuth = -1;
  bool _hideCreator = false;
  String _createdBy = "";
  int _createdByTc = -1;

  User(
      {int tc = -1,
      String name = "",
      String surname = "",
      int accessAuth = -1,
      bool hideCreator = false,
      String createdBy = "",
      int createdByTc = -1}) {
    _tc = tc;
    _name = name;
    _surname = surname;
    _accessAuth = accessAuth;
    _hideCreator = hideCreator;
    _createdBy = createdBy;
    _createdByTc = createdByTc;
  }

  int get tc => _tc;

  set tc(int value) {
    _tc = value;
  }

  int get createdByTc => _createdByTc;

  set createdByTc(int value) {
    _createdByTc = value;
  }

  String get createdBy => _createdBy;

  set createdBy(String value) {
    _createdBy = value;
  }

  bool get hideCreator => _hideCreator;

  set hideCreator(bool value) {
    _hideCreator = value;
  }

  int get accessAuth => _accessAuth;

  set accessAuth(int value) {
    _accessAuth = value;
  }

  String get surname => _surname;

  set surname(String value) {
    _surname = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }
}
