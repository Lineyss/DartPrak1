import 'package:shish_app/game/e_game_value.dart';

class GameField
{
  Map<int, GameValue> gamevalue = Map();

  void drow()
  {
    String game_field = "";

    for(int i = 1; i < 10 ; i ++)
    {
      game_field +=gamevalue[i]?.name ?? " ";

      if(i % 3 != 0) {
        game_field += " | ";
      }
      else
      {
        game_field += "\n";
      }

    }

    print(game_field);
  }

  void setValue(int position, GameValue value)
  {
    if(gamevalue.containsKey(position))
    {
      throw Exception("Позиция занята");
    }

    gamevalue[position] = value;
  }
}