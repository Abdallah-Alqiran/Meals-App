class MealModel {
  int? id;
  String imageUrl;
  String name;
  double rate;
  String description;
  String time;

  MealModel(
      {this.id,
      required this.imageUrl,
      required this.name,
      required this.rate,
      required this.description,
      required this.time});

  factory MealModel.fromJson(Map<String, dynamic> json) {
    return MealModel(
        id: json['id'],
        imageUrl: json['imageUrl'],
        name: json['name'],
        rate: json['rate'],
        description: json['description'],
        time: json['time']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imageUrl': imageUrl,
      'name': name,
      'rate': rate,
      'description': description,
      'time': time
    };
  }
}
