/// apkLink : ""
/// audit : 1
/// author : "xiaoyang"
/// canEdit : false
/// chapterId : 440
/// chapterName : "官方"
/// collect : false
/// courseId : 13
/// desc : "<p>今天的问题比较细了，探索一个大家可能没关注过的 API，View中包含一个方法：</p>\n<ul>\n<li>hasOverlappingRendering() </li>\n</ul>\n<p>问题很直接：</p>\n<ol>\n<li>这个方法有什么用？</li>\n<li>在什么情况下我们会考虑复写这个方法？</li>\n</ol>"
/// descMd : ""
/// envelopePic : ""
/// fresh : false
/// host : ""
/// id : 17131
/// link : "https://wanandroid.com/wenda/show/17131"
/// niceDate : "2021-01-31 17:20"
/// niceShareDate : "2021-01-31 17:09"
/// origin : ""
/// prefix : ""
/// projectLink : ""
/// publishTime : 1612084806000
/// realSuperChapterId : 439
/// selfVisible : 0
/// shareDate : 1612084141000
/// shareUser : ""
/// superChapterId : 440
/// superChapterName : "问答"
/// tags : [{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}]
/// title : "每日一问 | 今天还探索一个 View 的方法 hasOverlappingRendering()"
/// type : 1
/// userId : 2
/// visible : 1
/// zan : 5

class ArticleRes {
  String _apkLink;
  int _audit;
  String _author;
  bool _canEdit;
  int _chapterId;
  String _chapterName;
  bool _collect;
  int _courseId;
  String _desc;
  String _descMd;
  String _envelopePic;
  bool _fresh;
  String _host;
  int _id;
  String _link;
  String _niceDate;
  String _niceShareDate;
  String _origin;
  String _prefix;
  String _projectLink;
  int _publishTime;
  int _realSuperChapterId;
  int _selfVisible;
  int _shareDate;
  String _shareUser;
  int _superChapterId;
  String _superChapterName;
  List<Tags> _tags;
  String _title;
  int _type;
  int _userId;
  int _visible;
  int _zan;

  String get apkLink => _apkLink;

  int get audit => _audit;

  String get author => _author;

  bool get canEdit => _canEdit;

  int get chapterId => _chapterId;

  String get chapterName => _chapterName;

  bool get collect => _collect;

  int get courseId => _courseId;

  String get desc => _desc;

  String get descMd => _descMd;

  String get envelopePic => _envelopePic;

  bool get fresh => _fresh;

  String get host => _host;

  int get id => _id;

  String get link => _link;

  String get niceDate => _niceDate;

  String get niceShareDate => _niceShareDate;

  String get origin => _origin;

  String get prefix => _prefix;

  String get projectLink => _projectLink;

  int get publishTime => _publishTime;

  int get realSuperChapterId => _realSuperChapterId;

  int get selfVisible => _selfVisible;

  int get shareDate => _shareDate;

  String get shareUser => _shareUser;

  int get superChapterId => _superChapterId;

  String get superChapterName => _superChapterName;

  List<Tags> get tags => _tags;

  String get title => _title;

  int get type => _type;

  int get userId => _userId;

  int get visible => _visible;

  int get zan => _zan;

  ArticleRes(
      {String apkLink,
      int audit,
      String author,
      bool canEdit,
      int chapterId,
      String chapterName,
      bool collect,
      int courseId,
      String desc,
      String descMd,
      String envelopePic,
      bool fresh,
      String host,
      int id,
      String link,
      String niceDate,
      String niceShareDate,
      String origin,
      String prefix,
      String projectLink,
      int publishTime,
      int realSuperChapterId,
      int selfVisible,
      int shareDate,
      String shareUser,
      int superChapterId,
      String superChapterName,
      List<Tags> tags,
      String title,
      int type,
      int userId,
      int visible,
      int zan}) {
    _apkLink = apkLink;
    _audit = audit;
    _author = author;
    _canEdit = canEdit;
    _chapterId = chapterId;
    _chapterName = chapterName;
    _collect = collect;
    _courseId = courseId;
    _desc = desc;
    _descMd = descMd;
    _envelopePic = envelopePic;
    _fresh = fresh;
    _host = host;
    _id = id;
    _link = link;
    _niceDate = niceDate;
    _niceShareDate = niceShareDate;
    _origin = origin;
    _prefix = prefix;
    _projectLink = projectLink;
    _publishTime = publishTime;
    _realSuperChapterId = realSuperChapterId;
    _selfVisible = selfVisible;
    _shareDate = shareDate;
    _shareUser = shareUser;
    _superChapterId = superChapterId;
    _superChapterName = superChapterName;
    _tags = tags;
    _title = title;
    _type = type;
    _userId = userId;
    _visible = visible;
    _zan = zan;
  }

  ArticleRes.fromJson(dynamic json) {
    _apkLink = json["apkLink"];
    _audit = json["audit"];
    _author = json["author"];
    _canEdit = json["canEdit"];
    _chapterId = json["chapterId"];
    _chapterName = json["chapterName"];
    _collect = json["collect"];
    _courseId = json["courseId"];
    _desc = json["desc"];
    _descMd = json["descMd"];
    _envelopePic = json["envelopePic"];
    _fresh = json["fresh"];
    _host = json["host"];
    _id = json["id"];
    _link = json["link"];
    _niceDate = json["niceDate"];
    _niceShareDate = json["niceShareDate"];
    _origin = json["origin"];
    _prefix = json["prefix"];
    _projectLink = json["projectLink"];
    _publishTime = json["publishTime"];
    _realSuperChapterId = json["realSuperChapterId"];
    _selfVisible = json["selfVisible"];
    _shareDate = json["shareDate"];
    _shareUser = json["shareUser"];
    _superChapterId = json["superChapterId"];
    _superChapterName = json["superChapterName"];
    if (json["tags"] != null) {
      _tags = [];
      json["tags"].forEach((v) {
        _tags.add(Tags.fromJson(v));
      });
    }
    _title = json["title"];
    _type = json["type"];
    _userId = json["userId"];
    _visible = json["visible"];
    _zan = json["zan"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["apkLink"] = _apkLink;
    map["audit"] = _audit;
    map["author"] = _author;
    map["canEdit"] = _canEdit;
    map["chapterId"] = _chapterId;
    map["chapterName"] = _chapterName;
    map["collect"] = _collect;
    map["courseId"] = _courseId;
    map["desc"] = _desc;
    map["descMd"] = _descMd;
    map["envelopePic"] = _envelopePic;
    map["fresh"] = _fresh;
    map["host"] = _host;
    map["id"] = _id;
    map["link"] = _link;
    map["niceDate"] = _niceDate;
    map["niceShareDate"] = _niceShareDate;
    map["origin"] = _origin;
    map["prefix"] = _prefix;
    map["projectLink"] = _projectLink;
    map["publishTime"] = _publishTime;
    map["realSuperChapterId"] = _realSuperChapterId;
    map["selfVisible"] = _selfVisible;
    map["shareDate"] = _shareDate;
    map["shareUser"] = _shareUser;
    map["superChapterId"] = _superChapterId;
    map["superChapterName"] = _superChapterName;
    if (_tags != null) {
      map["tags"] = _tags.map((v) => v.toJson()).toList();
    }
    map["title"] = _title;
    map["type"] = _type;
    map["userId"] = _userId;
    map["visible"] = _visible;
    map["zan"] = _zan;
    return map;
  }
}

/// name : "本站发布"
/// url : "/article/list/0?cid=440"

class Tags {
  String _name;
  String _url;

  String get name => _name;

  String get url => _url;

  Tags({String name, String url}) {
    _name = name;
    _url = url;
  }

  Tags.fromJson(dynamic json) {
    _name = json["name"];
    _url = json["url"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = _name;
    map["url"] = _url;
    return map;
  }
}
