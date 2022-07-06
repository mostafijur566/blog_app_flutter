import 'package:blog_app_flutter/models/menu_item_model.dart';
import 'package:flutter/material.dart';

class MenuItems{
  static const List<MenuItemModel> allItem = [
    itemEdit,
    itemDelete
  ];

  static const itemEdit = MenuItemModel(
      text: 'Edit',
      icon: Icons.edit
  );

  static const itemDelete = MenuItemModel(
      text: 'Delete',
      icon: Icons.delete_forever
  );
}
