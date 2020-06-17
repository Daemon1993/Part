class NewListsBean {
  String showapiResError;
  int showapiResCode;
  String showapiResId;
  ShowapiResBody showapiResBody;

  NewListsBean(
      {this.showapiResError,
        this.showapiResCode,
        this.showapiResId,
        this.showapiResBody});

  NewListsBean.fromJson(Map<String, dynamic> json) {
    showapiResError = json['showapi_res_error'];
    showapiResCode = json['showapi_res_code'];
    showapiResId = json['showapi_res_id'];
    showapiResBody = json['showapi_res_body'] != null
        ? new ShowapiResBody.fromJson(json['showapi_res_body'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['showapi_res_error'] = this.showapiResError;
    data['showapi_res_code'] = this.showapiResCode;
    data['showapi_res_id'] = this.showapiResId;
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
  String id;
  bool havePic;
  String pubDate;
  String title;
  String channelName;
  List<Imageurls> imageurls;
  String desc;
  String source;
  String channelId;
  String link;
  String img;

  Contentlist(
      {this.id,
        this.havePic,
        this.pubDate,
        this.title,
        this.channelName,
        this.imageurls,
        this.desc,
        this.source,
        this.channelId,
        this.link,
        this.img});

  Contentlist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    havePic = json['havePic'];
    pubDate = json['pubDate'];
    title = json['title'];
    channelName = json['channelName'];
    if (json['imageurls'] != null) {
      imageurls = new List<Imageurls>();
      json['imageurls'].forEach((v) {
        imageurls.add(new Imageurls.fromJson(v));
      });
    }
    desc = json['desc'];
    source = json['source'];
    channelId = json['channelId'];
    link = json['link'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['havePic'] = this.havePic;
    data['pubDate'] = this.pubDate;
    data['title'] = this.title;
    data['channelName'] = this.channelName;
    if (this.imageurls != null) {
      data['imageurls'] = this.imageurls.map((v) => v.toJson()).toList();
    }
    data['desc'] = this.desc;
    data['source'] = this.source;
    data['channelId'] = this.channelId;
    data['link'] = this.link;
    data['img'] = this.img;
    return data;
  }
}

class Imageurls {
  int height;
  int width;
  String url;

  Imageurls({this.height, this.width, this.url});

  Imageurls.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    width = json['width'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    data['width'] = this.width;
    data['url'] = this.url;
    return data;
  }
}
