import 'package:wan_android/module/home/bean/res/ArticleRes.dart';

/// curPage : 2
/// offset : 20
/// over : false
/// pageCount : 500
/// size : 20
/// total : 9987

class ArticlePageRes {
  int _curPage;
  int _offset;
  bool _over;
  int _pageCount;
  int _size;
  int _total;
  List<ArticleRes> _datas;

  int get curPage => _curPage;

  int get offset => _offset;

  bool get over => _over;

  int get pageCount => _pageCount;

  int get size => _size;

  int get total => _total;

  List<ArticleRes> get data => _datas;

  ArticlePageRes(
      {int curPage,
      int offset,
      bool over,
      int pageCount,
      int size,
      int total,
      List<ArticleRes> data}) {
    _curPage = curPage;
    _offset = offset;
    _over = over;
    _pageCount = pageCount;
    _size = size;
    _total = total;
    _datas = data;
  }

  ArticlePageRes.fromJson(dynamic json) {
    _curPage = json["curPage"];
    _offset = json["offset"];
    _over = json["over"];
    _pageCount = json["pageCount"];
    _size = json["size"];
    _total = json["total"];

    List<dynamic> articleList = json["datas"] as List;
    _datas = <ArticleRes>[];
    _datas.addAll(articleList.map<ArticleRes>((e) => ArticleRes.fromJson(e)));
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["curPage"] = _curPage;
    map["offset"] = _offset;
    map["over"] = _over;
    map["pageCount"] = _pageCount;
    map["size"] = _size;
    map["total"] = _total;
    map["data"] = _datas;
    return map;
  }
}
