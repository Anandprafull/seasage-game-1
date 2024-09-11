import 'package:flame/components.dart';
import 'package:flame/extensions.dart';

class Joystick extends JoystickComponent {
  static const double radius = 40;

  Joystick({required Image backgroundImage, required Image knobImage, required double gameHeight})
      : super(
          anchor: Anchor.bottomLeft,
          position: Vector2(20, gameHeight - 20),
          background: SpriteComponent.fromImage(backgroundImage, size: Vector2.all(radius * 2)),
          knob: SpriteComponent.fromImage(knobImage, size: Vector2.all(radius / 2)),
        );
}
