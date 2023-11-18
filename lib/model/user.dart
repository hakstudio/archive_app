class User {
  int? _id;
  int? _tc;
  String? _name;
  String? _surname;
  int? _accessAuth;
  bool? _hideCreator;
  String? _createdBy;
  int? _createdByTc;

  User(
      {int? id,
        int? tc,
        String? name,
        String? surname,
        int? accessAuth,
        bool? hideCreator,
        String? createdBy,
        int? createdByTc}) {
    if (id != null) {
      this._id = id;
    }
    if (tc != null) {
      this._tc = tc;
    }
    if (name != null) {
      this._name = name;
    }
    if (surname != null) {
      this._surname = surname;
    }
    if (accessAuth != null) {
      this._accessAuth = accessAuth;
    }
    if (hideCreator != null) {
      this._hideCreator = hideCreator;
    }
    if (createdBy != null) {
      this._createdBy = createdBy;
    }
    if (createdByTc != null) {
      this._createdByTc = createdByTc;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  int? get tc => _tc;
  set tc(int? tc) => _tc = tc;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get surname => _surname;
  set surname(String? surname) => _surname = surname;
  int? get accessAuth => _accessAuth;
  set accessAuth(int? accessAuth) => _accessAuth = accessAuth;
  bool? get hideCreator => _hideCreator;
  set hideCreator(bool? hideCreator) => _hideCreator = hideCreator;
  String? get createdBy => _createdBy;
  set createdBy(String? createdBy) => _createdBy = createdBy;
  int? get createdByTc => _createdByTc;
  set createdByTc(int? createdByTc) => _createdByTc = createdByTc;

  User.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _tc = json['tc'];
    _name = json['name'];
    _surname = json['surname'];
    _accessAuth = json['accessAuth'];
    _hideCreator = json['hideCreator'];
    _createdBy = json['createdBy'];
    _createdByTc = json['createdByTc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tc'] = this._tc;
    data['name'] = this._name;
    data['surname'] = this._surname;
    data['accessAuth'] = this._accessAuth;
    data['hideCreator'] = this._hideCreator;
    return data;
  }
}