import 'package:flutter/material.dart';
import 'package:redux_in_flutter/item_filter.dart';

@immutable
class AppState{
  final Iterable<String> items;
  final ItemFilter itemFilter;

  Iterable<String> get filteredItems {
    switch(itemFilter){
      case(ItemFilter.all):
        return items;
      case(ItemFilter.longText):
        return items.where((item) => item.length >= 10);
      default:
        return items.where((item) => item.length <= 3);
    }
  }

  const AppState({
    required this.items,
    required this.itemFilter
  });
}