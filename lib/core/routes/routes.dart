import 'package:assesment/base/base_event.dart';
import 'package:assesment/core/injection_container/feed_injection_container.dart';
import 'package:assesment/core/routes/routes_name.dart';
import 'package:assesment/features/presentation/bloc/button_like_bloc.dart';
import 'package:assesment/features/presentation/bloc/display_feed_list_bloc.dart';
import 'package:assesment/features/presentation/bloc/favourite_like_bloc.dart';
import 'package:assesment/features/presentation/pages/feed_page.dart';
import 'package:assesment/features/presentation/pages/post_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Routes {
  static Route<dynamic> generatedRoutes(RouteSettings route) {
    switch (route.name) {
      case RoutesName.feedPage:
        return MaterialPageRoute(builder: (_) {
          return MultiBlocProvider(providers: [
            BlocProvider<ButtonLikeBloc>(
              create: (context) => fIC<ButtonLikeBloc>(),
            ),
            BlocProvider<FavouriteLikeBloc>(
              create: (context) =>
                  fIC<FavouriteLikeBloc>(),
            ),
            BlocProvider<DisplayFeedListBloc>(
              create: (context) =>
                  fIC<DisplayFeedListBloc>()..add(EventRequest("")),
            ),
          ], child: FeedPage());
        });
      case RoutesName.postPage:
        return MaterialPageRoute(builder: (_) {
          return PostPage();
        });
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text("No Routes defined for ${route.name}"),
            ),
          );
        });
    }
  }
}
