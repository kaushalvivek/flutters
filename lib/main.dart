import 'package:flame/flame.dart';
import 'package:flame/util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import 'package:flutters/flutters-game.dart';

void main() async {
  Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);

  Flame.images.loadAll(<String>[
    'bird-0.png',
    'bird-1.png',
    'bird-0-left.png',
    'bird-1-left.png',
    'cloud-1.png',
    'cloud-2.png',
    'cloud-3.png',
  ]);

  FluttersGame game = FluttersGame();
  TapGestureRecognizer tapSink = TapGestureRecognizer();
  tapSink.onTapDown = game.onTapDown;
  tapSink.onTapUp = game.onTapUp;

  runApp(game.widget);
  flameUtil.addGestureRecognizer(tapSink);
}
