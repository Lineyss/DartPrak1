import 'package:shish_app/e_game_value.dart';
import 'package:shish_app/game_field.dart';
import 'package:shish_app/shish_app.dart' as shish_app;

void main(List<String> arguments) {
  GameField gameField = GameField();
  gameField.setValue(2, GameValue.X);
  gameField.drow(); 
}
