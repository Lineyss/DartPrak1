import 'dart:math';

import 'package:shish_app/player/player.dart';

class PlayerBot extends Player
{
  PlayerBot(super.gameField);

  @override
  int getPosition() {
    var rand = Random();
    int position = 1 + rand.nextInt(9);

    if(checkValidPosition(position))
    {
      return position;
    }

    return getPosition();
  }
  
}