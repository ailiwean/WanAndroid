/// children : [{"children":[],"courseId":13,"id":60,"name":"Android Studio相关","order":1000,"parentChapterId":150,"visible":1},null]
/// courseId : 13
/// id : 150
/// name : "开发环境"
/// order : 1
/// parentChapterId : 0
/// visible : 1

class SystemRes {
  List<Children> _children;
  int _courseId;
  int _id;
  String _name;
  int _order;
  int _parentChapterId;
  int _visible;

  List<Children> get children => _children;

  int get courseId => _courseId;

  int get id => _id;

  String get name => _name;

  int get order => _order;

  int get parentChapterId => _parentChapterId;

  int get visible => _visible;

  SystemRes(
      {List<Children> children,
      int courseId,
      int id,
      String name,
      int order,
      int parentChapterId,
      int visible}) {
    _children = children;
    _courseId = courseId;
    _id = id;
    _name = name;
    _order = order;
    _parentChapterId = parentChapterId;
    _visible = visible;
  }

  SystemRes.fromJson(dynamic json) {
    if (json["children"] != null) {
      _children = [];
      json["children"].forEach((v) {
        _children.add(Children.fromJson(v));
      });
    }
    _courseId = json["courseId"];
    _id = json["id"];
    _name = json["name"];
    _order = json["order"];
    _parentChapterId = json["parentChapterId"];
    _visible = json["visible"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_children != null) {
      map["children"] = _children.map((v) => v.toJson()).toList();
    }
    map["courseId"] = _courseId;
    map["id"] = _id;
    map["name"] = _name;
    map["order"] = _order;
    map["parentChapterId"] = _parentChapterId;
    map["visible"] = _visible;
    return map;
  }
}

/// children : []
/// courseId : 13
/// id : 60
/// name : "Android Studio相关"
/// order : 1000
/// parentChapterId : 150
/// visible : 1

class Children {
  List<dynamic> _children;
  int _courseId;
  int _id;
  String _name;
  int _order;
  int _parentChapterId;
  int _visible;

  List<dynamic> get children => _children;

  int get courseId => _courseId;

  int get id => _id;

  String get name => _name;

  int get order => _order;

  int get parentChapterId => _parentChapterId;

  int get visible => _visible;

  Children(
      {List<dynamic> children,
      int courseId,
      int id,
      String name,
      int order,
      int parentChapterId,
      int visible}) {
    _children = children;
    _courseId = courseId;
    _id = id;
    _name = name;
    _order = order;
    _parentChapterId = parentChapterId;
    _visible = visible;
  }

  Children.fromJson(dynamic json) {
    if (json["children"] != null) {
      _children = [];
      json["children"].forEach((v) {
        _children.add(v);
      });
    }
    _courseId = json["courseId"];
    _id = json["id"];
    _name = json["name"];
    _order = json["order"];
    _parentChapterId = json["parentChapterId"];
    _visible = json["visible"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_children != null) {
      map["children"] = _children.map((v) => v.toJson()).toList();
    }
    map["courseId"] = _courseId;
    map["id"] = _id;
    map["name"] = _name;
    map["order"] = _order;
    map["parentChapterId"] = _parentChapterId;
    map["visible"] = _visible;
    return map;
  }
}
