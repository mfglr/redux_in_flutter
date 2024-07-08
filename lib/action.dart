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