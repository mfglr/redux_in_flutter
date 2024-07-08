import 'package:redux/redux.dart';
import 'package:redux_in_flutter/actions.dart';
import 'package:redux_in_flutter/app_state.dart';
import 'package:redux_in_flutter/services/item_service.dart';

void loadItemsMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is LoadItemsAction){
    ItemService().getItems().then((items){
      store.dispatch(SuccessfullyFetchItemsedAction(items: items));
    });
  }
  next(action);
}