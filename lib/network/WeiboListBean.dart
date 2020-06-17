class WeiboListBean {
  String showapiResError;
  String showapiResId;
  int showapiResCode;
  ShowapiResBody showapiResBody;

  WeiboListBean(
      {this.showapiResError,
        this.showapiResId,
        this.showapiResCode,
        this.showapiResBody});

  WeiboListBean.fromJson(Map<String, dynamic> json) {
    showapiResError = json['showapi_res_error'];
    showapiResId = json['showapi_res_id'];
    showapiResCode = json['showapi_res_code'];
    showapiResBody = json['showapi_res_body'] != null
        ? new ShowapiResBody.fromJson(json['showapi_res_body'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['showapi_res_error'] = this.showapiResError;
    data['showapi_res_id'] = this.showapiResId;
    data['showapi_res_code'] = this.showapiResCode;
    if (this.showapiResBody != null) {
      data['showapi_res_body'] = this.showapiResBody.toJson();
    }
    return data;
  }
}

class ShowapiResBody {
  int retCode;
  Pagebean pagebean;

  ShowapiResBody({this.retCode, this.pagebean});

  ShowapiResBody.fromJson(Map<String, dynamic> json) {
    retCode = json['ret_code'];
    pagebean = json['pagebean'] != null
        ? new Pagebean.fromJson(json['pagebean'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ret_code'] = this.retCode;
    if (this.pagebean != null) {
      data['pagebean'] = this.pagebean.toJson();
    }
    return data;
  }
}

class Pagebean {
  int allPages;
  List<Contentlist> contentlist;
  int currentPage;
  int allNum;
  int maxResult;

  Pagebean(
      {this.allPages,
        this.contentlist,
        this.currentPage,
        this.allNum,
        this.maxResult});

  Pagebean.fromJson(Map<String, dynamic> json) {
    allPages = json['allPages'];
    if (json['contentlist'] != null) {
      contentlist = new List<Contentlist>();
      json['contentlist'].forEach((v) {
        contentlist.add(new Contentlist.fromJson(v));
      });
    }
    currentPage = json['currentPage'];
    allNum = json['allNum'];
    maxResult = json['maxResult'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['allPages'] = this.allPages;
    if (this.contentlist != null) {
      data['contentlist'] = this.contentlist.map((v) => v.toJson()).toList();
    }
    data['currentPage'] = this.currentPage;
    data['allNum'] = this.allNum;
    data['maxResult'] = this.maxResult;
    return data;
  }
}

class Contentlist {
  String typeName;
  int num;
  String desc;
  String newinfo;
  String name;
  String img;
  String influence;
  int date;
  String space;
  String typeId;
  String url;

  Contentlist(
      {this.typeName,
        this.num,
        this.desc,
        this.newinfo,
        this.name,
        this.img,
        this.influence,
        this.date,
        this.space,
        this.typeId,
        this.url});

  Contentlist.fromJson(Map<String, dynamic> json) {
    typeName = json['typeName'];
    num = json['num'];
    desc = json['desc'];
    newinfo = json['newinfo'];
    name = json['name'];
    img = json['img'];
    influence = json['influence'];
    date = json['date'];
    space = json['space'];
    typeId = json['typeId'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['typeName'] = this.typeName;
    data['num'] = this.num;
    data['desc'] = this.desc;
    data['newinfo'] = this.newinfo;
    data['name'] = this.name;
    data['img'] = this.img;
    data['influence'] = this.influence;
    data['date'] = this.date;
    data['space'] = this.space;
    data['typeId'] = this.typeId;
    data['url'] = this.url;
    return data;
  }
}
