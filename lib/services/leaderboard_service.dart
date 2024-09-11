import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logging/logging.dart';

class LeaderboardEntry {
  final String pseudo;
  final int score;
  final Timestamp createdAt;
  final int collectingSpeedLevel;
  final int diveDepthLevel;
  final int swimmingSpeedLevel;
  final int airTankLevel;

  LeaderboardEntry({
    required this.pseudo,
    required this.score,
    required this.collectingSpeedLevel,
    required this.diveDepthLevel,
    required this.swimmingSpeedLevel,
    required this.airTankLevel,
    Timestamp? createdAt,
  }) : createdAt = createdAt ?? Timestamp.now();

  static LeaderboardEntry fromJson(Map<String, dynamic> data) {
    return LeaderboardEntry(
      pseudo: data['pseudo'] as String,
      score: data['score'] as int,
      createdAt: data['createdAt'] as Timestamp,
      collectingSpeedLevel: data['collectingSpeedLevel'] as int,
      diveDepthLevel: data['diveDepthLevel'] as int,
      swimmingSpeedLevel: data['swimmingSpeedLevel'] as int,
      airTankLevel: data['airTankLevel'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pseudo': pseudo,
      'score': score,
      'createdAt': createdAt,
      'collectingSpeedLevel': collectingSpeedLevel,
      'diveDepthLevel': diveDepthLevel,
      'swimmingSpeedLevel': swimmingSpeedLevel,
      'airTankLevel': airTankLevel,
    };
  }
}

class LeaderboardService {
  static const int limit = 10;
  static const String collectionName = 'leaderboard';
  static const String scoreField = 'score';

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final Logger _logger = Logger('LeaderboardService');

  LeaderboardService() {
    _logger.level = Level.SEVERE;
  }

  Future<List<LeaderboardEntry>> getLeaderboard({int limit = 30}) async {
    final QuerySnapshot querySnapshot = await _firebaseFirestore
        .collection(collectionName)
        .orderBy(scoreField, descending: true)
        .limit(limit)
        .get();

    return querySnapshot.docs.toLeaderboard(_logger);
  }

  Future<void> addScore(LeaderboardEntry entry) async {
    if (entry.score <= 0 || entry.pseudo.isEmpty) {
      return;
    }

    try {
      await _firebaseFirestore.collection(collectionName).add(entry.toJson());
    } catch (error) {
      _logger.severe('Error adding leaderboard entry: $error');
    }
  }
}

extension on List<QueryDocumentSnapshot> {
  List<LeaderboardEntry> toLeaderboard(Logger logger) {
    final leaderboardEntries = <LeaderboardEntry>[];
    for (final document in this) {
      final data = document.data() as Map<String, dynamic>?;
      if (data != null) {
        try {
          leaderboardEntries.add(LeaderboardEntry.fromJson(data));
        } catch (error) {
          logger.severe('Error parsing leaderboard entry: $error');
        }
      }
    }
    return leaderboardEntries;
  }
}