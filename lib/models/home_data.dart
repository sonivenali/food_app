class HomeData {
  List<OtherFood> otherFood;
  List<Recommended> recommended;

  HomeData({this.otherFood, this.recommended});

  HomeData.fromJson(Map<String, dynamic> json) {
    if (json['other_food'] != null) {
      otherFood = new List<OtherFood>();
      json['other_food'].forEach((v) {
        otherFood.add(new OtherFood.fromJson(v));
      });
    }
    if (json['recommended'] != null) {
      recommended = new List<Recommended>();
      json['recommended'].forEach((v) {
        recommended.add(new Recommended.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.otherFood != null) {
      data['other_food'] = this.otherFood.map((v) => v.toJson()).toList();
    }
    if (this.recommended != null) {
      data['recommended'] = this.recommended.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OtherFood {
  String name;
  String image;
  String price;

  OtherFood({this.name, this.image, this.price});

  OtherFood.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['price'] = this.price;
    return data;
  }
}

class Recommended {
  String name;
  String image;
  String rating;

  Recommended({this.name, this.image, this.rating});

  Recommended.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['rating'] = this.rating;
    return data;
  }
}
