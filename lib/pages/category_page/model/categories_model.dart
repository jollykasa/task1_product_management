

class CategoriesModel {
  final String? slug;
  final String? name;
  final String? url;

  CategoriesModel({
    this.slug,
    this.name,
    this.url,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      CategoriesModel(
        slug: json["slug"],
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "slug": slug,
        "name": name,
        "url": url,
      };

  static List<CategoriesModel>? fromJsonList(List? list) {
    if (list == null) return null;
    return list.map((item) => CategoriesModel.fromJson(item)).toList();
  }
}
