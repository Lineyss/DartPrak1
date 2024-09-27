import 'dart:io';

import 'package:shish_app/item_menu.dart';

class Menu
{
  late List<ItemMenu> _items;
  bool _exit = false;

  Menu(List<ItemMenu> items)
  {
    items.add(ItemMenu("Выход", ()=> _exit = true));
    _items = items;
  }

  void _display()
  {
    for(int i = 0; i < _items.length; i ++)
    {
      print("${i+1}) ${_items[i].name}");
    }
  }

  ItemMenu? _select(String position)
  {
    int? intPosition = int.tryParse(position);

    if(intPosition == null || intPosition < 1 || intPosition > _items.length)
    {
      return null;
    }

    return _items[intPosition-1];
  }

  void start()
  {
    do
    {
      _display();
      stdout.write("Выберите пункт меню: ");
      String value = stdin.readLineSync() ?? "";
      ItemMenu? itemMenu = _select(value);

      if(itemMenu == null)
      {
        print("Ошибка: Не верный ввод");
      }
      else
      {
        print("Вы выбрали ${itemMenu.name}");
        itemMenu.action();
      }
    }
    while(!_exit);
  }
}