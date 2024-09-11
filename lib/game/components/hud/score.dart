import 'package:flame/components.dart';
import 'package:flame/extensions.dart' as flame_extensions;
import 'package:flame/text.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';

class Score extends PositionComponent {
  int previousHighScore;
  bool isNewHighScore = false;
  late final TextComponent<TextRenderer> scoreTextComponent;

  // Create image component for high score stamp
  late final PositionComponent highScoreStamp;

  Score({
    required ValueNotifier<int> scoreNotifier,
    required this.previousHighScore,
    required flame_extensions.Image highScoreStampImage,
  }) : super(size: Vector2(100, 100), position: Vector2(10, 20), anchor: Anchor.topLeft) {
    // Add callback to update score text
    scoreNotifier.addListener(() {
      String scoreText = 'Score: ${scoreNotifier.value}';
      if (scoreNotifier.value > previousHighScore && !isNewHighScore) {
        isNewHighScore = true;
        Future.delayed(const Duration(milliseconds: 300), () {
          FlameAudio.play('sfx/high-score.mp3');
          add(highScoreStamp);
        });
      }

      scoreTextComponent.text = scoreText;
    });

    // Create image component for high score stamp
    highScoreStamp = SpriteComponent.fromImage(
      highScoreStampImage,
      size: Vector2(40, 40),
      position: Vector2(80, 20),
      anchor: Anchor.topLeft,
      priority: -1,
    );
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    add(
      scoreTextComponent = TextComponent(
        text: 'Score: 0',
        position: Vector2(10, 10),
        textRenderer: TextPaint(
            style: const TextStyle(
                fontFamily: 'PixeloidSans',
                fontSize: 25,
                color: Colors.white,
                shadows: [Shadow(blurRadius: 7, color: Colors.black, offset: Offset(0, 0))])),
      ),
    );
  }
}
