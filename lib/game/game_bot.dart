import 'package:shish_app/game/e_game_value.dart';
import 'package:shish_app/game/game_field.dart';
import 'dart:math';

class GameBot
{
  late GameField _gameField;

  GameBot(GameField gameField)
  {
    _gameField = gameField;
  }

  int _generatePosition()
  {
    var rand = Random();
    return 1 + rand.nextInt(9);
  }

  void play(GameValue gameValue)
  {
    int position = _generatePosition();
    try
    {
      _gameField.setValue(position, gameValue);
    }
    catch(e)
    {
      play(gameValue);
    }
  }
}