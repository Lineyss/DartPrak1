import 'dart:math';

import 'package:shish_app/game/game_field.dart';
import 'package:shish_app/player/playet_bot.dart';

import 'package:shish_app/game/e_game_value.dart';
import 'package:shish_app/player/player_human.dart';

class PlayGame
{
  final _winCombination = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
    [1, 4, 7],
    [2, 5, 8],
    [3, 6, 9],
    [1, 5, 9],
    [3, 5, 7],
  ];

  late String resultMessage;
  GameValue? resultValue;

  late GameValue _gameValue;
  late PlayerBot _playerBot;
  late PlayerHuman _playerHuman;

  final GameField _gameField = GameField();

  GameValue get __gameValue
  {
    var value = _gameValue;
    _gameValue = _gameValue == GameValue.X ? GameValue.O : GameValue.X;
    return value;
  }

  PlayGame()
  {
    _gameValue = _createStratValue();

    _playerBot = PlayerBot(_gameField);
    _playerHuman = PlayerHuman(_gameField);
  }

  GameValue _createStratValue()
  {
    var rand = Random();
    var number = rand.nextInt(2);
    return GameValue.values[number];
  }

  void _checkResult()
  {
    for(var combination in _winCombination)
    {
      var a = _gameField.gamevalue[combination[0]];
      var b = _gameField.gamevalue[combination[1]];
      var c = _gameField.gamevalue[combination[2]];

      if(a != null && a == b && a == c)
      {
        resultMessage = "Победили ${a.name}";
        resultValue = a;
      }
      else if (_gameField.gamevalue.length == 9)
      {
        resultMessage = "Ничья";
      }
    }
  }

  void makeMove(Function(GameValue) playerMakeMove)
  {
    if(resultValue == null)
    {
      playerMakeMove(__gameValue);
      _checkResult();
    }
  }

  GameValue startWithBot()
  {
    print("Первые ${_gameValue.name}");
    _gameField.drow();
    while(resultValue == null)
    {
      makeMove(_playerHuman.makeMove);
      makeMove(_playerBot.makeMove);
    }

    print(resultMessage);

    return resultValue!;
  }
  
  GameValue startWithPeople()
  {
    print("Первые ${_gameValue.name}");
    _gameField.drow();

    while(resultValue == null)
    {
      makeMove(_playerHuman.makeMove);
      makeMove(_playerHuman.makeMove);
    }

    print(resultMessage);

    return resultValue!;
  }

}