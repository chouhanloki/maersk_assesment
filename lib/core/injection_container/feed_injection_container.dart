import 'package:assesment/features/presentation/bloc/button_like_bloc.dart';
import 'package:assesment/features/presentation/bloc/display_feed_list_bloc.dart';
import 'package:assesment/features/presentation/bloc/favourite_like_bloc.dart';
import 'package:get_it/get_it.dart';
final fIC = GetIt.instance;

Future<void> init() async{
  //Intialize service for single instance
  //Bloc

  fIC.registerFactory(() => ButtonLikeBloc());
  fIC.registerFactory(() => FavouriteLikeBloc());
  fIC.registerFactory(() => DisplayFeedListBloc());

}
