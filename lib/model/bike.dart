class BikeModel {
  int? id;
  String? name;
  String? description;
  double? price;
  String? imageUrl;

  BikeModel({this.id, this.name, this.description, this.price, this.imageUrl});

  BikeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    imageUrl = json['image_url'];
  }
}
