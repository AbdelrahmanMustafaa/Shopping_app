class ProductModel {
  List<p>? products;

  ProductModel(this.products);

  ProductModel.fromJson(dynamic json, String x) {
    products = <p>[];
    json[x].forEach((e) {
      products!.add(p.fromJson(e));
    });
  }
}

class p {
  int? id;
  String? category;
  Map? sizes;
  int? discount;
  int? price;
  String? image;
  double? rate;

  p({
    this.id,
    this.category,
    this.discount,
    this.sizes,
    this.image,
    this.price,
    this.rate,
  });

  p.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    discount = json['discount'];
    price = json['price'];
    image = json['image'];
    rate = json['rating'];
    sizes = json['size'];

  }
}
/*class Size {
  List? size ;
  List? quantity ;
  Size({this.size, this.quantity});
  Size.fromJson(Map<String, dynamic> json) {
    json.keys.forEach((element) {
      json.forEach((key, value) {
        size!.add(key);
        quantity!.add(value);
        print('key: $key, value: $value');
      });
    });
  }
}*/
