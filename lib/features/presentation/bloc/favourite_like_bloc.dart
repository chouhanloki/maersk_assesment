import 'package:assesment/base/base_event.dart';
import 'package:assesment/base/base_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteLikeBloc extends Bloc<BaseEvent,BaseState>{
  FavouriteLikeBloc() : super(StateOnSuccess(false));
  @override
  Stream<BaseState> mapEventToState(BaseEvent event) async*{
    if(event is EventRequest){
      add(EventOnSuccess(!event.request));
    } else if(event is EventOnSuccess){
      yield StateOnSuccess(event.response);
    }

    // TODO: implement mapEventToState

  }
}