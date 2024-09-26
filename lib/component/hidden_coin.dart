import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'dart:ui';

class HiddenCoin extends PositionComponent {
  HiddenCoin({
    required super.position,
  }) : super(
          size: Vector2(40, 40),
          anchor: Anchor.center,
        );
  late Sprite _dashSprite;
  @override
  Future<void> onLoad() async {
    super.onLoad();
    _dashSprite = await Sprite.load('dash.png');
    final radius = size.x / 2;
    final center = size / 2;
    add(CircleHitbox(
      collisionType: CollisionType.passive,
      radius: radius * 0.75,
      position: center * 1.1,
      anchor: Anchor.center,
    ));
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    _dashSprite.render(
      canvas,
      size: size,
    );
  }
}
