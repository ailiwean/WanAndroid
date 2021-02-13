/// admin : false
/// chapterTops : []
/// coinCount : 0
/// collectIds : []
/// email : ""
/// icon : ""
/// id : 87389
/// nickname : "www1"
/// password : ""
/// publicName : "www1"
/// token : ""
/// type : 0
/// username : "www1"

class LoginRes {
  bool _admin;
  List<dynamic> _chapterTops;
  int _coinCount;
  List<dynamic> _collectIds;
  String _email;
  String _icon;
  int _id;
  String _nickname;
  String _password;
  String _publicName;
  String _token;
  int _type;
  String _username;

  bool get admin => _admin;

  List<dynamic> get chapterTops => _chapterTops;

  int get coinCount => _coinCount;

  List<dynamic> get collectIds => _collectIds;

  String get email => _email;

  String get icon => _icon;

  int get id => _id;

  String get nickname => _nickname;

  String get password => _password;

  String get publicName => _publicName;

  String get token => _token;

  int get type => _type;

  String get username => _username;

  LoginRes(
      {bool admin,
      List<dynamic> chapterTops,
      int coinCount,
      List<dynamic> collectIds,
      String email,
      String icon,
      int id,
      String nickname,
      String password,
      String publicName,
      String token,
      int type,
      String username}) {
    _admin = admin;
    _chapterTops = chapterTops;
    _coinCount = coinCount;
    _collectIds = collectIds;
    _email = email;
    _icon = icon;
    _id = id;
    _nickname = nickname;
    _password = password;
    _publicName = publicName;
    _token = token;
    _type = type;
    _username = username;
  }

  LoginRes.fromJson(dynamic json) {
    _admin = json["admin"];
    if (json["chapterTops"] != null) {
      _chapterTops = [];
      json["chapterTops"].forEach((v) {
        _chapterTops.add(v);
      });
    }
    _coinCount = json["coinCount"];
    if (json["collectIds"] != null) {
      _collectIds = [];
      json["collectIds"].forEach((v) {
        _collectIds.add(v);
      });
    }
    _email = json["email"];
    _icon = json["icon"];
    _id = json["id"];
    _nickname = json["nickname"];
    _password = json["password"];
    _publicName = json["publicName"];
    _token = json["token"];
    _type = json["type"];
    _username = json["username"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["admin"] = _admin;
    if (_chapterTops != null) {
      map["chapterTops"] = _chapterTops.map((v) => v.toJson()).toList();
    }
    map["coinCount"] = _coinCount;
    if (_collectIds != null) {
      map["collectIds"] = _collectIds.map((v) => v.toJson()).toList();
    }
    map["email"] = _email;
    map["icon"] = _icon;
    map["id"] = _id;
    map["nickname"] = _nickname;
    map["password"] = _password;
    map["publicName"] = _publicName;
    map["token"] = _token;
    map["type"] = _type;
    map["username"] = _username;
    return map;
  }
}
