class Note {
  final String id;
  final String gameId;
  final String text;
  final DateTime createdAt;
  final List<String> tags;

  Note({
    required this.id,
    required this.gameId,
    required this.text,
    required this.createdAt,
    required this.tags,
  });

  Note copyWith({
    String? text,
    List<String>? tags,
  }) {
    return Note(
      id: id,
      gameId: gameId,
      text: text ?? this.text,
      createdAt: createdAt,
      tags: tags ?? List<String>.from(this.tags),
    );
  }
}
