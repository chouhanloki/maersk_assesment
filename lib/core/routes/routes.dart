import 'package:assesment/core/routes/routes_name.dart';
import 'package:assesment/features/presentation/pages/feed_page.dart';
import 'package:assesment/features/presentation/pages/post_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Routes{
  static Route<dynamic> generatedRoutes(RouteSettings route){
    switch(route.name){
      case RoutesName.feedPage:
        return MaterialPageRoute(builder: (_){
          return FeedPage();
        });
        case RoutesName.postPage:
        return MaterialPageRoute(builder: (_){
          return PostPage();
        });
      default:
        return MaterialPageRoute(builder: (_){
          return Scaffold(
            body: Center(child: Text("No Routes defined for ${route.name}"),),
          );
        });
    }
  }
}