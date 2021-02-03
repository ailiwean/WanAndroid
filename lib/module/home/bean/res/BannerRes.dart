/// desc : "扔物线"
/// id : 29
/// imagePath : "https://wanandroid.com/blogimgs/8690f5f9-733a-476a-8ad2-2468d043c2d4.png"
/// isVisible : 1
/// order : 0
/// title : "Kotlin 的 Lambda，大部分人学得连皮毛都不算"
/// type : 0
/// url : "http://i0k.cn/5jhSp"

class BannerRes {
  String _desc;
  int _id;
  String _imagePath;
  int _isVisible;
  int _order;
  String _title;
  int _type;
  String _url;

  String get desc => _desc;
  int get id => _id;
  String get imagePath => _imagePath;
  int get isVisible => _isVisible;
  int get order => _order;
  String get title => _title;
  int get type => _type;
  String get url => _url;

  BannerRes({
      String desc, 
      int id, 
      String imagePath, 
      int isVisible, 
      int order, 
      String title, 
      int type, 
      String url}){
    _desc = desc;
    _id = id;
    _imagePath = imagePath;
    _isVisible = isVisible;
    _order = order;
    _title = title;
    _type = type;
    _url = url;
}

  BannerRes.fromJson(dynamic json) {
    _desc = json["desc"];
    _id = json["id"];
    _imagePath = json["imagePath"];
    _isVisible = json["isVisible"];
    _order = json["order"];
    _title = json["title"];
    _type = json["type"];
    _url = json["url"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["desc"] = _desc;
    map["id"] = _id;
    map["imagePath"] = _imagePath;
    map["isVisible"] = _isVisible;
    map["order"] = _order;
    map["title"] = _title;
    map["type"] = _type;
    map["url"] = _url;
    return map;
  }

}