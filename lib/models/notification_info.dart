class NotificationInfo {
  final int id;
  final String title;
  final String description;
  final int? amount;
  final String? sad;
  final DateTime publishedAt;

  NotificationInfo({
    required this.id,
    required this.title,
    required this.description,
    required this.amount,
    required this.sad,
    required this.publishedAt,
  });

  static NotificationInfo fromJson(Map<String, dynamic> json) {
    return NotificationInfo(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      amount: json["amount"],
      sad: null,
      publishedAt: json["publishedAt"],
    );
  }
}
