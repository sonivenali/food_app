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
  String about;
  String image;
  String rating;
  String ingredients1;
  String ingredients2;
  String ingredients3;
  String ingredients4;

  Recommended(
      {this.name,
        this.about,
        this.image,
        this.rating,
        this.ingredients1,
        this.ingredients2,
        this.ingredients3,
        this.ingredients4});

  Recommended.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    about = json['about'];
    image = json['image'];
    rating = json['rating'];
    ingredients1 = json['ingredients1'];
    ingredients2 = json['ingredients2'];
    ingredients3 = json['ingredients3'];
    ingredients4 = json['ingredients4'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['about'] = this.about;
    data['image'] = this.image;
    data['rating'] = this.rating;
    data['ingredients1'] = this.ingredients1;
    data['ingredients2'] = this.ingredients2;
    data['ingredients3'] = this.ingredients3;
    data['ingredients4'] = this.ingredients4;
    return data;
  }
}
