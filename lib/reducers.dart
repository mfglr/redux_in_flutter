import 'package:redux_in_flutter/actions.dart';
import 'package:redux/redux.dart';
import 'package:redux_in_flutter/item_filter.dart';
import 'package:redux_in_flutter/app_state.dart';

Iterable<String> addItemReducer(Iterable<String> prevItems,AddItemAction action)
  => prevItems.followedBy([action.item]);

Iterable<String> removeItemReducer(Iterable<String> prevItems,RemoveItemAction action)
  => prevItems.where((item) => item != action.item);

Reducer<Iterable<String>> itemReducer = combineReducers<Iterable<String>>([
  TypedReducer<Iterable<String>,AddItemAction>(addItemReducer).call,
  TypedReducer<Iterable<String>,RemoveItemAction>(removeItemReducer).call,
]);


ItemFilter itemFilterReducer(ItemFilter oldItemFilter,Action action){
  if(action is ChangeFilterTypeAction) action.itemFilter;
  return oldItemFilter;
}


AppState appStateReducer(AppState oldState,Action action) 
  => AppState(
    items: itemReducer(oldState.items,action),
    itemFilter: itemFilterReducer(oldState.itemFilter, action)
  );
