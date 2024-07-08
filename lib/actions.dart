import 'package:flutter/material.dart';
import 'package:redux_in_flutter/item_filter.dart';

@immutable
abstract class Action{
  const Action();
}

@immutable
class ChangeFilterTypeAction extends Action{
  final ItemFilter itemFilter;
  const ChangeFilterTypeAction({required this.itemFilter});
}

@immutable
class AddItemAction extends Action{
  final String item;
  const AddItemAction({required this.item});
}

@immutable
class RemoveItemAction extends Action{
  final String item;
  const RemoveItemAction({required this.item});
}

@immutable
class LoadItemsAction extends Action{
  const LoadItemsAction();
}

@immutable
class SuccessfullyFetchItemsedAction extends Action{
  final List<String> items;
  const SuccessfullyFetchItemsedAction({required this.items});
}