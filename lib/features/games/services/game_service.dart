import '../models/game.dart';

class GameService {
  final List<Game> _games = [
    Game(
      id: '1',
      title: 'Cyberpunk 2077',
      genre: 'Action RPG',
      status: 'Playing',
      imageUrl: 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1091500/header.jpg',
      rating: 4.8,
      comment: 'Киберпанковская атмосфера, великолепная графика и саундтрек.',
    ),
    Game(
      id: '2',
      title: 'The Witcher 3: Wild Hunt',
      genre: 'RPG',
      status: 'Completed',
      imageUrl: 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/292030/header.jpg',
      rating: 5.0,
      comment: 'Одна из лучших RPG всех времён — сюжет, атмосфера, музыка!',
    ),
    Game(
      id: '3',
      title: 'Hades',
      genre: 'Rogue-like Action',
      status: 'Planned',
      imageUrl: 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1145360/header.jpg',
      rating: 4.6,
      comment: 'Захватывающий геймплей, визуальный стиль и озвучка!',
    ),
    Game(
      id: '4',
      title: 'Stardew Valley',
      genre: 'Simulation / Farming',
      status: 'Completed',
      imageUrl: 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/413150/header.jpg',
      rating: 4.9,
      comment: 'Спокойная и уютная фермерская жизнь с пиксельным шармом.',
    ),
    Game(
      id: '5',
      title: 'Hollow Knight',
      genre: 'Metroidvania / Adventure',
      status: 'Playing',
      imageUrl: 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/367520/header.jpg',
      rating: 4.7,
      comment: 'Потрясающий мир, сложные боссы и прекрасная атмосфера одиночества.',
    ),
  ];

  List<Game> get games => _games;

  void addGame(Game game) => _games.add(game);

  Game? getById(String id) {
    try {
      return _games.firstWhere((g) => g.id == id);
    } catch (_) {
      return null;
    }
  }

  void updateGame(String id, Game updated) {
    final index = _games.indexWhere((g) => g.id == id);
    if (index != -1) _games[index] = updated;
  }

  void deleteGame(String id) {
    _games.removeWhere((g) => g.id == id);
  }

  void toggleStatus(String id) {
    final game = getById(id);
    if (game == null) return;

    String newStatus;

    switch (game.status) {
      case 'Playing':
        newStatus = 'Completed';
        break;
      case 'Completed':
        newStatus = 'Planned';
        break;
      default:
        newStatus = 'Playing';
        break;
    }

    updateGame(
      id,
      Game(
        id: game.id,
        title: game.title,
        genre: game.genre,
        status: newStatus,
        imageUrl: game.imageUrl,
        rating: game.rating,
        comment: game.comment,
      ),
    );
  }

  void deleteCompleted() {
    _games.removeWhere((g) => g.status == 'Completed');
  }
}
