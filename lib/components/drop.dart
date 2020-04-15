import 'dart:ui';
import 'package:watergame/water-game.dart';
import 'package:flame/sprite.dart';

class Drop {
  final WaterGame game;
  Rect dropRect;
  //Paint dropPaint;

  bool isOffScreen= false;
  Sprite fallingDrop;


  Drop(this.game, double x, double y){
    dropRect = Rect.fromLTWH(x, y, game.tileSize, game.tileSize);
    fallingDrop = Sprite('water-drop.png');

  }

  void render(Canvas c){
    fallingDrop.renderRect(c, dropRect.inflate(2));


  }
  void update(double t){


    dropRect =dropRect.translate(0, game.tileSize * 7 * t);
    if (dropRect.top > game.screenSize.height) {
      isOffScreen = true;
      game.isOffScreencount += 1;
      print(game.isOffScreencount);


    }
  }

}