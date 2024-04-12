class DataModel {
  String? status;
  String? message;
  Data? data;

  DataModel({this.status, this.message, this.data});

  DataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Thirukural>? thirukural;
  List<AppSlider>? appSlider;
  Null? foodtime;
  List<MenuData>? menuData;
  //List<Null>? menufilterData;
  List<ListofKitchens>? listofKitchens;
  List<ListofPopularfoods>? listofPopularfoods;
  List<ListofRecentfoods>? listofRecentfoods;

  Data(
      {this.thirukural,
        this.appSlider,
        this.foodtime,
        this.menuData,
        //this.menufilterData,
        this.listofKitchens,
        this.listofPopularfoods,
        this.listofRecentfoods});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['Thirukural'] != null) {
      thirukural = <Thirukural>[];
      json['Thirukural'].forEach((v) {
        thirukural!.add(new Thirukural.fromJson(v));
      });
    }
    if (json['App_slider'] != null) {
      appSlider = <AppSlider>[];
      json['App_slider'].forEach((v) {
        appSlider!.add(new AppSlider.fromJson(v));
      });
    }
    foodtime = json['foodtime'];
    if (json['Menu_Data'] != null) {
      menuData = <MenuData>[];
      json['Menu_Data'].forEach((v) {
        menuData!.add(new MenuData.fromJson(v));
      });
    }
    /* if (json['Menufilter_data'] != null) {
      menufilterData = <Null>[];
      json['Menufilter_data'].forEach((v) {
        menufilterData!.add(new Null.fromJson(v));
      });
    }*/
    if (json['Listof_Kitchens'] != null) {
      listofKitchens = <ListofKitchens>[];
      json['Listof_Kitchens'].forEach((v) {
        listofKitchens!.add(new ListofKitchens.fromJson(v));
      });
    }
    if (json['Listof_Popularfoods'] != null) {
      listofPopularfoods = <ListofPopularfoods>[];
      json['Listof_Popularfoods'].forEach((v) {
        listofPopularfoods!.add(new ListofPopularfoods.fromJson(v));
      });
    }
    if (json['Listof_Recentfoods'] != null) {
      listofRecentfoods = <ListofRecentfoods>[];
      json['Listof_Recentfoods'].forEach((v) {
        listofRecentfoods!.add(new ListofRecentfoods.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.thirukural != null) {
      data['Thirukural'] = this.thirukural!.map((v) => v.toJson()).toList();
    }
    if (this.appSlider != null) {
      data['App_slider'] = this.appSlider!.map((v) => v.toJson()).toList();
    }
    data['foodtime'] = this.foodtime;
    if (this.menuData != null) {
      data['Menu_Data'] = this.menuData!.map((v) => v.toJson()).toList();
    }
    /*if (this.menufilterData != null) {
      data['Menufilter_data'] =
          this.menufilterData!.map((v) => v.toJson()).toList();
    }*/
    if (this.listofKitchens != null) {
      data['Listof_Kitchens'] =
          this.listofKitchens!.map((v) => v.toJson()).toList();
    }
    if (this.listofPopularfoods != null) {
      data['Listof_Popularfoods'] =
          this.listofPopularfoods!.map((v) => v.toJson()).toList();
    }
    if (this.listofRecentfoods != null) {
      data['Listof_Recentfoods'] =
          this.listofRecentfoods!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Thirukural {
  Null? line1;
  Null? line2;

  Thirukural({this.line1, this.line2});

  Thirukural.fromJson(Map<String, dynamic> json) {
    line1 = json['line1'];
    line2 = json['line2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['line1'] = this.line1;
    data['line2'] = this.line2;
    return data;
  }
}

class AppSlider {
  String? image;

  AppSlider({this.image});

  AppSlider.fromJson(Map<String, dynamic> json) {
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    return data;
  }
}

class MenuData {
  String? menuid;
  String? menuimg;
  String? menuname;

  MenuData({this.menuid, this.menuimg, this.menuname});

  MenuData.fromJson(Map<String, dynamic> json) {
    menuid = json['menuid'];
    menuimg = json['menuimg'];
    menuname = json['menuname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['menuid'] = this.menuid;
    data['menuimg'] = this.menuimg;
    data['menuname'] = this.menuname;
    return data;
  }
}

class ListofKitchens {
  String? kitchenpic;
  String? kname;
  String? cookid;
  String? address;
  String? city;
  String? state;
  String? country;
  String? ratings;
  String? ktype;
  String? pincode;

  ListofKitchens(
      {this.kitchenpic,
        this.kname,
        this.cookid,
        this.address,
        this.city,
        this.state,
        this.country,
        this.ratings,
        this.ktype,
        this.pincode});

  ListofKitchens.fromJson(Map<String, dynamic> json) {
    kitchenpic = json['kitchenpic'];
    kname = json['kname'];
    cookid = json['cookid'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    ratings = json['ratings'];
    ktype = json['ktype'];
    pincode = json['pincode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kitchenpic'] = this.kitchenpic;
    data['kname'] = this.kname;
    data['cookid'] = this.cookid;
    data['address'] = this.address;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['ratings'] = this.ratings;
    data['ktype'] = this.ktype;
    data['pincode'] = this.pincode;
    return data;
  }
}

class ListofPopularfoods {
  String? id;
  String? cookid;
  String? foodname;
  String? kname;
  String? availqty;
  String? review;
  String? type;
  String? foodpic;

  ListofPopularfoods(
      {this.id,
        this.cookid,
        this.foodname,
        this.kname,
        this.availqty,
        this.review,
        this.type,
        this.foodpic});

  ListofPopularfoods.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cookid = json['cookid'];
    foodname = json['foodname'];
    kname = json['kname'];
    availqty = json['availqty'];
    review = json['review'];
    type = json['type'];
    foodpic = json['foodpic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cookid'] = this.cookid;
    data['foodname'] = this.foodname;
    data['kname'] = this.kname;
    data['availqty'] = this.availqty;
    data['review'] = this.review;
    data['type'] = this.type;
    data['foodpic'] = this.foodpic;
    return data;
  }
}
class ListofRecentfoods {
  String? id;
  String? cookid;
  String? foodname;
  String? kname;
  String? availqty;
  String? review;
  String? type;
  String? foodpic;

  ListofRecentfoods(
      {this.id,
        this.cookid,
        this.foodname,
        this.kname,
        this.availqty,
        this.review,
        this.type,
        this.foodpic});

  ListofRecentfoods.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cookid = json['cookid'];
    foodname = json['foodname'];
    kname = json['kname'];
    availqty = json['availqty'];
    review = json['review'];
    type = json['type'];
    foodpic = json['foodpic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cookid'] = this.cookid;
    data['foodname'] = this.foodname;
    data['kname'] = this.kname;
    data['availqty'] = this.availqty;
    data['review'] = this.review;
    data['type'] = this.type;
    data['foodpic'] = this.foodpic;
    return data;
  }
}