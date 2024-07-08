import 'package:redux/redux.dart';
import 'package:redux_in_flutter/app_state.dart';
import 'package:redux_in_flutter/item_filter.dart';
import 'package:redux_in_flutter/reducers.dart';

final store = Store(
  appStateReducer,
  initialState: const AppState(itemFilter: ItemFilter.all,items: [])
);
