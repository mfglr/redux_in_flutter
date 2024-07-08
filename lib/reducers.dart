import 'package:redux_in_flutter/actions.dart';
import 'package:redux/redux.dart';
import 'package:redux_in_flutter/item_filter.dart';
import 'package:redux_in_flutter/app_state.dart';

Iterable<String> addItemReducer(Iterable<String> prevItems,AddItemAction action)
  => prevItems.followedBy([action.item]);

Iterable<String> removeItemReducer(Iterable<String> prevItems,RemoveItemAction action)
  => prevItems.where((item) => item != action.item);

Iterable<String> successfullyFetchItems(Iterable<String> prevItems,SuccessfullyFetchItemsedAction action)
  => prevItems.followedBy(action.items);

bool loadItemsReducer(AppState prevState,Action action)
  => action is LoadItemsAction ? true : prevState.isLoading; 

Reducer<Iterable<String>> itemReducer = combineReducers<Iterable<String>>([
  TypedReducer<Iterable<String>,AddItemAction>(addItemReducer).call,
  TypedReducer<Iterable<String>,RemoveItemAction>(removeItemReducer).call,
  TypedReducer<Iterable<String>,SuccessfullyFetchItemsedAction>(successfullyFetchItems).call,
]);

ItemFilter itemFilterReducer(ItemFilter itemFilter,Action action){
  if(action is ChangeFilterTypeAction) return action.itemFilter;
  return itemFilter;
}



AppState appStateReducer(AppState oldState, action) 
  => AppState(
    items: itemReducer(oldState.items,action),
    itemFilter: itemFilterReducer(oldState.itemFilter, action),
    isLoading: loadItemsReducer(oldState, action),
  );
