import 'package:redux_in_flutter/actions.dart';

Iterable<String> addItemReducer(Iterable<String> prevItems,AddItemAction action)
  => prevItems.followedBy([action.item]);