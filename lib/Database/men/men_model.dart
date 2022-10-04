class Men {
  final TShirts tShirts;
  final Caps caps;
  final Pants pants;
  Men({required this.tShirts , required this.caps , required this.pants});
}
class TShirts{
  final List<TShirtStyle> tShirts;
  TShirts({required this.tShirts});
}
class TShirtStyle{
  final List<Color> colors;
  TShirtStyle({required this.colors});
}
class Caps{
  final List<CapStyle> caps;
  Caps({required this.caps});
}
class CapStyle{
  final List<Color> colors;
  CapStyle({required this.colors});
}
class Pants{
  final List<PantStyle> pants;
  Pants({required this.pants});
}
class PantStyle{
  final List<Color> colors;
  PantStyle({required this.colors});
}
class Color {
  final String id;
  final String image;
  final String price;
  final String description;
  final String category;
  final String rating;
  final String discount;
  final String quantity;
  final List<Size> size;

  Color(
      {required this.id,
      required this.image,
      required this.price,
      required this.description,
      required this.category,
      required this.rating,
      required this.discount,
      required this.quantity ,
      required this.size
     });
}
class Size {
  final  Map<String , int> quantity;
  Size({required this.quantity});
}

