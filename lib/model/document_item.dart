class DocumentItem {
  int _docId = -1;
  String _docName = "";
  int _accessAuth = -1;
  DateTime _date = DateTime.now();
  String _uploadedBy = "";
  int _uploadedByTc = -1;
  String _edittedBy = "";
  int _edittedByTc = -1;
  String _docUrl = "";

  int get docId => _docId;

  set docId(int value) {
    _docId = value;
  }

  String get docUrl => _docUrl;

  set docUrl(String value) {
    _docUrl = value;
  }

  int get edittedByTc => _edittedByTc;

  set edittedByTc(int value) {
    _edittedByTc = value;
  }

  String get edittedBy => _edittedBy;

  set edittedBy(String value) {
    _edittedBy = value;
  }

  int get uploadedByTc => _uploadedByTc;

  set uploadedByTc(int value) {
    _uploadedByTc = value;
  }

  String get uploadedBy => _uploadedBy;

  set uploadedBy(String value) {
    _uploadedBy = value;
  }

  DateTime get date => _date;

  set date(DateTime value) {
    _date = value;
  }

  int get accessAuth => _accessAuth;

  set accessAuth(int value) {
    _accessAuth = value;
  }

  String get docName => _docName;

  set docName(String value) {
    _docName = value;
  }
}
