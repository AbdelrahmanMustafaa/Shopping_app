class ProductModel {
  List<p>? products;
   ProductModel(this.products) ;
  ProductModel.fromJson(dynamic json , String x)
  {
    products = <p>[];
    json[x].forEach((e){
      products!.add(p.fromJson(e));
    });
  }

}

class p {
  int? id;
  String? category;

  p(
      {this.id,

        this.category,
       });

   p.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    category = json['category'];

  }
}