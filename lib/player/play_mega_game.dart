import 'package:shish_app/game/game_field.dart';
import 'package:shish_app/player/play_game.dart';
import 'package:shish_app/game/e_game_value.dart';

class PlayMegaGame
{
  final GameField _gameField = GameField();
  String? resultMessage;


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
      }
      else if (_gameField.gamevalue.length == 9)
      {
        resultMessage = "Ничья";
      }
    }
  }

  void start()
  {
    for(int i = 1; i < 10 ; i ++)
    {
      GameValue? value;
      PlayGame playGame = PlayGame();
      do
      {
        print("Игра под номером $i");
        value = playGame.startWithPeople();
        _gameField.setValue(i, value);
      }
      // ignore: unnecessary_null_comparison
      while(value == null);

      print("Основное поле");
      _gameField.drow();

      _checkResult();

      if(resultMessage != null)
      {
        break;
      }
    }
    print(resultMessage);
  }
}