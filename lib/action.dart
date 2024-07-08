import 'package:flutter/material.dart';
import 'package:redux_in_flutter/item_filter.dart';

@immutable
abstract class Action{
  const Action();
}

@immutable
class ChangeFilterTypeAction extends Action{
  final ItemFilter filter;
  const ChangeFilterTypeAction({required this.filter});
}

@immutable
class AddItemAction{
  final String item;
  const AddItemAction({required this.item});
}

class RemoveItemAction{
  final String item;
  const RemoveItemAction({required this.item});
}
