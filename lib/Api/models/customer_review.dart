class CusReview {
  late String name;
  late String review;
  late String date;

  CusReview({required this.name, required this.date, required this.review});

  factory CusReview.fromJson(Map<String, dynamic> json) =>
      CusReview(name: json['name'], date: json['date'], review: json['review']);
}
