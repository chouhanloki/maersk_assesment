import 'package:assesment/base/base_event.dart';
import 'package:assesment/base/base_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonLikeBloc extends Bloc<BaseEvent,BaseState>{
  ButtonLikeBloc() : super(StateOnSuccess(0));
  @override
  Stream<BaseState> mapEventToState(BaseEvent event) async*{
    if(event is EventRequest){
      add(EventOnSuccess(event.request+1));
    } else if(event is EventOnSuccess){
      yield StateOnSuccess(event.response);
    }

    // TODO: implement mapEventToState

  }
}