import 'package:redux_in_flutter/actions.dart';

Iterable<String> addItemReducer(Iterable<String> prevItems,AddItemAction action)
  => prevItems.followedBy([action.item]);

Iterable<String> removeItemReducer(Iterable<String> prevItems,RemoveItemAction action)
  => prevItems.where((item) => item != action.item);