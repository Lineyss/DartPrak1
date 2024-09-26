import 'package:shish_app/e_game_value.dart';
import 'package:shish_app/game_field.dart';
import 'dart:io';

class PlayGame
{
  final _win_combination = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
    [1, 4, 7],
    [2, 5, 8],
    [3, 6, 9],
    [1, 5, 9],
    [3, 5, 7],
  ];

  late GameField _gameField;

  GameValue? result;

  PlayGame(GameField gameField)
  {
    _gameField = gameField;
  }

  void _checkResult()
  {
    for(var combination in _win_combination)
    {
      var a = _gameField.gamevalue[combination[0]];
      var b = _gameField.gamevalue[combination[1]];
      var c = _gameField.gamevalue[combination[2]];

      if(a != null && a == b && a == c)
      {
        result = a;
      }
    }
  }

  void start_with_bot()
  {

  }
  
  void start_with_people()
  {
    var i = 1;
    while(result == null)
    {
      _gameField.drow();
      print("Введите номер ячейки (1-9): ");
      String? positon = stdin.readLineSync();
    }
  }

  int make_move()
  {
      String? positon;

      while(positon == null || positon.isEmpty)
      {
        print("Введите номер ячейки (1-9):");
        positon = stdin.readLineSync();
      }

      int value = 
  }
}