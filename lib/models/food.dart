class Assetd {
  final String name;
  final String description;
  final String image;
  final double price;
  final AssetCategoryd category;
  List<Featured> features;

  Assetd({
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.category,
    required this.features,
  });
}

class Featured {
  String name;
  String description;
  Featured({required this.name, required this.description});
}

enum AssetCategoryd {
  land,
  house,
}
