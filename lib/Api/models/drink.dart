class Drink {
  late String name;
  Drink({required this.name});

  factory Drink.fromJson(Map<String, dynamic> json) =>
      Drink(name: json['name']);
}
