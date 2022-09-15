class Food {
  late String name;
  Food({required this.name});

  factory Food.fromJosn(Map<String, dynamic> json) => Food(name: json['name']);
}
