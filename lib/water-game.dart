import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flame/flame.dart';
import 'package:watergame/components/drop.dart';
import 'dart:math';
import 'package:watergame/components/backyard.dart';
import 'package:watergame/components/virus.dart';


class WaterGame extends Game{
  Size screenSize;
  double tileSize;
  List<Drop> drops;
  List<Virus> viruses;
  Random randomNumber;
  double creationTimer = 0.0;
  int isOffScreencount= 0;
  bool gameOver = false;
  Backyard background;
  double touchPositionDx = 0.0;
  double touchPositionDy = 0.0;

  WaterGame(){
    initialize();
  }
  void initialize() async {
    drops = List<Drop>();
    viruses = List<Virus>();
    resize(await Flame.util.initialDimensions());
    randomNumber = Random();

    background= Backyard(this);

    spawnDrop();

  }

  void render(Canvas canvas){
    background.render(canvas);
    drops.forEach((Drop drop) => drop.render(canvas));
    viruses.forEach((Virus virus) => virus.render(canvas));


  }
  void update(double t){
    creationTimer += t;
   // print(creationTimer);


    if(creationTimer>=1.0){
      creationTimer = 0.0;
      if(isOffScreencount ==5 ){
        print("GAME OVER---------------");
        spawnVirus();

      }else{
        spawnDrop();

      }



    }
    drops.forEach((Drop drop) => drop.update(t));
    drops.removeWhere((Drop drop) => drop.isOffScreen);
    viruses.forEach((Virus virus) => virus.update(t));

  }

  void resize(Size size){
    screenSize = size;
    tileSize=screenSize.width/9;

  //  super.resize(size);
  }
  void spawnDrop(){
    double x = randomNumber.nextDouble() * (screenSize.width - tileSize);
  //  double y = randomNumber.nextDouble() * (screenSize.height - tileSize);
    drops.add(Drop(this, x,0));
  }
  void spawnVirus(){
    double x = randomNumber.nextDouble() * (screenSize.width - tileSize);
    //  double y = randomNumber.nextDouble() * (screenSize.height - tileSize);
    viruses.add(Virus(this, x,0));
  }
 
}