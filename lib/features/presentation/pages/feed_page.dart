import 'package:assesment/base/base_event.dart';
import 'package:assesment/base/base_state.dart';
import 'package:assesment/core/routes/routes_name.dart';
import 'package:assesment/core/utils/Strings.dart';
import 'package:assesment/features/domain/entities/feed_data_model.dart';
import 'package:assesment/features/presentation/bloc/button_like_bloc.dart';
import 'package:assesment/features/presentation/bloc/display_feed_list_bloc.dart';
import 'package:assesment/features/presentation/bloc/favourite_like_bloc.dart';
import 'package:assesment/features/presentation/widgets/feed_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedPage extends StatelessWidget {
  DisplayFeedListBloc? displayFeedListBloc;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    displayFeedListBloc=BlocProvider.of<DisplayFeedListBloc>(context);
    return Scaffold(
        resizeToAvoidBottomInset:false,
      appBar: AppBar(
        title: const Text(Strings.feedPageTitle),
      ),
      body: MultiBlocListener(listeners: [
        BlocListener<ButtonLikeBloc, BaseState>(
          listener: (context, state) {
            if (state is StateOnSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Button Liked ${state.response} times!!!"),
              ));
            }
          },
        ),
        BlocListener<FavouriteLikeBloc, BaseState>(
          listener: (context, state) {
            if (state is StateOnSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Favourite clicked with response ${state.response}"),
              ));
            }
          },
        )
      ], child: FeedWidget()),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, RoutesName.postPage).then((value) {
            if(value is FeedDataModel){
              displayFeedListBloc?.add(EventRequest(value));
            }
          });
        },
      ),
    );
  }
}
