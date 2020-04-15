import 'dart:ui';
import 'package:watergame/water-game.dart';
import 'package:flame/sprite.dart';

class Virus {
  final WaterGame game;
  Rect virusRect;
  //Paint virusPaint;
  //double creationTimer = 0.0;
 // bool isOffScreen= false;
  Sprite fallingVirus;
  //List<Sprite> virusSprite;

  double virusSpriteIndex = 0;


  Virus(this.game, double x, double y){
    virusRect = Rect.fromLTWH(x, y, game.tileSize, game.tileSize);
    fallingVirus = Sprite('moradovirus.png');

  }

  void render(Canvas c){
    fallingVirus.renderRect(c, virusRect.inflate(2));


  }
  void update(double t){


    virusRect =virusRect.translate(0, game.tileSize * 7 * t);
    if (virusRect.top > game.screenSize.height) {
    //  isOffScreen = true;
      //game.isOffScreencount += 1;
   //   print(game.isOffScreencount);


    }
  }

}