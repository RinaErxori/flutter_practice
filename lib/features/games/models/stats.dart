class Stats {
  final int total;
  final int completed;
  final int playing;
  final int backlog;

  const Stats({
    required this.total,
    required this.completed,
    required this.playing,
    required this.backlog,
  });
}

const sampleStats = Stats(total: 12, completed: 5, playing: 4, backlog: 3);
