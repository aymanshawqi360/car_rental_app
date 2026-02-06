class BrandResponse {
  int? id;
  String? name;
  String? image;

  BrandResponse({required this.id, required this.name, required this.image});

  factory BrandResponse.fromJson(Map<String, dynamic> json) {
    return BrandResponse(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
  Map<String, dynamic> toJson(BrandResponse result) => {
    'id': result.id,
    'name': result.name,
    'image': result.image,
  };
}
