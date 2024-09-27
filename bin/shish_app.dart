import 'package:shish_app/item_menu.dart';
import 'package:shish_app/menu.dart';
import 'package:shish_app/player/play_game.dart';
import 'package:shish_app/player/play_mega_game.dart';

void main(List<String> arguments) {
  
  Menu menu = Menu([
    ItemMenu("Играть против бота", PlayGame().startWithBot),
    ItemMenu("Играть против игрока", PlayGame().startWithPeople),
    ItemMenu("Игра 9x9", PlayMegaGame().start)
  ]);

  menu.start();
}
