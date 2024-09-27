import 'dart:io';

import 'package:shish_app/game/e_game_value.dart';
import 'package:shish_app/player/player.dart';

class PlayerHuman extends Player
{
  late GameValue _gameValue;

  PlayerHuman(super.gameField);

    @override
  int getPosition() {
    int? position;
    bool isValidInput = false;

    do
    {
      stdout.write("Введите номер ячейки (1-9) ${_gameValue.name}: ");
      String? input = stdin.readLineSync() ?? "";

      position = int.tryParse(input);
      bool value = checkValidPosition(position);      
      isValidInput = value;

    }
    while(!isValidInput);

    return position!;
  }

  @override
  void makeMove(GameValue gameValue) {
    _gameValue = gameValue;
    super.makeMove(gameValue);
  }
}