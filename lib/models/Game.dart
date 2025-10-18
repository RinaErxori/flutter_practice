class Game {
  String id;
  String title;
  String genre;
  String status;
  double? rating;
  String? comment;

  Game({
    required this.id,
    required this.title,
    required this.genre,
    required this.status,
    this.rating,
    this.comment,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'genre': genre,
    'status': status,
    'rating': rating,
    'comment': comment,
  };

  static Game fromJson(Map<String, dynamic> json) => Game(
    id: json['id'],
    title: json['title'],
    genre: json['genre'],
    status: json['status'],
    rating: json['rating'] != null ? (json['rating'] as num).toDouble() : null,
    comment: json['comment'],
  );
}
