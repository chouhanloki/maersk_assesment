import 'package:assesment/base/base_event.dart';
import 'package:assesment/base/base_state.dart';
import 'package:assesment/core/utils/image_path.dart';
import 'package:assesment/features/domain/entities/feed_data_model.dart';
import 'package:assesment/features/domain/entities/search_feed_data_model.dart';
import 'package:assesment/features/presentation/bloc/button_like_bloc.dart';
import 'package:assesment/features/presentation/bloc/display_feed_list_bloc.dart';
import 'package:assesment/features/presentation/bloc/favourite_like_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedWidget extends StatefulWidget {
  @override
  State<FeedWidget> createState() => _FeedWidgetState();
}

class _FeedWidgetState extends State<FeedWidget> {
  TextEditingController? searchController;
  ButtonLikeBloc? buttonLikeBloc;
  FavouriteLikeBloc? favouriteLikeBloc;
  DisplayFeedListBloc? displayFeedListBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    buttonLikeBloc = BlocProvider.of<ButtonLikeBloc>(context);
    favouriteLikeBloc = BlocProvider.of<FavouriteLikeBloc>(context);
    displayFeedListBloc = BlocProvider.of<DisplayFeedListBloc>(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
              controller: searchController,
              decoration: const InputDecoration(
                  hintText: 'Search',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  )),
          onChanged: (value){
                displayFeedListBloc?.add(FilterEvent(value));
          }),
        ),
        bottomListView(context)
      ],
    );
  }

  Widget bottomListView(BuildContext context) {
    return BlocBuilder<DisplayFeedListBloc, BaseState>(
      builder: (context, state) {
        if (state is StateOnSuccess) {
          SearchFeedDataModel searchFeedDataModel = state.response;
          List<FeedDataModel> feedDataModelList =
              searchFeedDataModel.filterActualList!;
          return ListView.builder(
              shrinkWrap: true,
              itemCount: feedDataModelList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          feedDataModelList[index].title!,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            feedDataModelList[index].description!,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 20),
                          ),
                        ),
                        Center(
                          child: Image.asset(
                            feedDataModelList[index].imagePath!,
                            height: 40,
                            width: 40,
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                                child: ElevatedButton(
                              onPressed: () {
                                buttonLikeBloc?.add(EventRequest(
                                    feedDataModelList[index].likesCount));
                              },
                              child: const Icon(Icons.thumb_up_sharp,
                                  color: Colors.white),
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                              ),
                            )),
                            ElevatedButton(
                              onPressed: () {
                                favouriteLikeBloc?.add(EventRequest(
                                    feedDataModelList[index].thumbsUp));
                              },
                              child: const Icon(Icons.favorite,
                                  color: Colors.white),
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              });
        } else {
          return const Text("No Feed to display");
        }
      },
    );
  }
}
