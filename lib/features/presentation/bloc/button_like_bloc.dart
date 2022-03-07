import 'package:assesment/base/base_event.dart';
import 'package:assesment/base/base_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonLikeBloc extends Bloc<BaseEvent,BaseState>{
  ButtonLikeBloc(BaseState initialState) : super(StateOnSuccess(false));


}