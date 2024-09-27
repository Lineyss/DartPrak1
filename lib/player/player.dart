import 'package:shish_app/game/e_game_value.dart';
import 'package:shish_app/game/game_field.dart';

abstract class Player
{
  late GameField gameField;

  Player(this.gameField);

  bool checkValidPosition(int? positon)
  {
    if(positon == null || positon < 1 || positon > 9 || gameField.gamevalue.containsKey(positon))
    {
      return false;
    }

    return true;
  }

  int getPosition();

  void makeMove(GameValue gameValue)
  {
    var position = getPosition();
    gameField.setValue(position, gameValue);
    gameField.drow();
  }
}