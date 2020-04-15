import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:watergame/water-game.dart';

class Backyard{
  final WaterGame game;
  Sprite bgSprite;
  Rect bgRect;


  Backyard(this.game){
    bgSprite = Sprite('bg/greyclouds3.png');

    bgRect = Rect.fromLTWH(
      0,
      game.screenSize.height - (game.tileSize * 23),
      game.tileSize * 9,
      game.tileSize * 23,
    );
  }
  void render(Canvas c) {
    bgSprite.renderRect(c, bgRect);
  }

  void update(double t) {}

}