import 'package:redux/redux.dart';
import 'package:smartblooddonor/home/home_actions.dart';
import 'package:smartblooddonor/home/home_state.dart';

Reducer<HomeState> homeReducer = combineReducers([
  TypedReducer<HomeState, HomePageSuccessAction>(_homePageSuccessActionCreator),
]);

HomeState _getCopy(HomeState state) {
  return HomeState().copyWith(

  );
}

HomeState _homePageSuccessActionCreator(HomeState state, HomePageSuccessAction action) {
  return _getCopy(state);
}
