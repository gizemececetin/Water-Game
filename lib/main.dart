import 'package:flame/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:watergame/water-game.dart';
import 'package:flame/flame.dart';
import 'package:flutter/gestures.dart';

void main() async {
  WaterGame game = WaterGame();
  runApp(game.widget);

  Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);

  Flame.images.loadAll(<String>[
    'bg/greyclouds3.png',
    'moradovirus.png',
    'water-drop.png'
  ]);


}

