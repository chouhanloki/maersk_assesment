import 'package:assesment/base/base_event.dart';
import 'package:assesment/base/base_state.dart';
import 'package:assesment/core/utils/image_path.dart';
import 'package:assesment/features/domain/entities/feed_data_model.dart';
import 'package:assesment/features/domain/entities/search_feed_data_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DisplayFeedListBloc extends Bloc<BaseEvent, BaseState> {
  DisplayFeedListBloc() : super(StateInitialFeed());
  @override
  Stream<BaseState> mapEventToState(BaseEvent event) async* {
    // TODO: implement mapEventToState
    if (event is EventRequest) {
      if(event.request is String)
      createList();
      else{
        StateOnSuccess stateOnSuccess= state as StateOnSuccess;
        SearchFeedDataModel searchFeedDataModel=stateOnSuccess.response;
        searchFeedDataModel.filterActualList!.add(event.request);
        searchFeedDataModel.actualList?.add(event.request);
        yield StateOnSuccess(searchFeedDataModel);
      }
    } else if (event is FilterEvent) {
      StateOnSuccess stateOnSuccess = state as StateOnSuccess;
      SearchFeedDataModel searchFeedDataModel = stateOnSuccess.response;
      if (event.filterText!.isEmpty) {
        searchFeedDataModel.filterActualList?.clear();
        searchFeedDataModel.filterActualList
            ?.addAll(searchFeedDataModel.actualList!);
        add(EventOnSuccess(searchFeedDataModel));
      } else {
        searchFeedDataModel.filterActualList?.clear();

        searchFeedDataModel.actualList?.forEach((feedData) {
          if (feedData.description!.toLowerCase().contains(event.filterText!.toLowerCase()) || feedData.title!.toLowerCase()
              .contains(feedData.description!.toLowerCase())) {
            searchFeedDataModel.filterActualList!.add(feedData);
          }
        });
        add(EventOnSuccess(searchFeedDataModel));

      }
    } else if (event is EventOnSuccess) {
      yield StateOnSuccess(event.response);
    }
  }

  void createList() {
    List<FeedDataModel> list = [
      FeedDataModel(
          description: "Description 1",
          imagePath: ImagePath.flutterLogo,
          likesCount: 0,
          thumbsUp: false,
          title: "Item 1"),
      FeedDataModel(
          description: "Description 2",
          imagePath: ImagePath.flutterLogo,
          likesCount: 0,
          thumbsUp: false,
          title: "Item 2"),
      FeedDataModel(
          description: "Description 3",
          imagePath: ImagePath.flutterLogo,
          likesCount: 0,
          thumbsUp: false,
          title: "Item 3")
    ];

    add(EventOnSuccess(
        SearchFeedDataModel(actualList: list, filterActualList: list)));
  }
}

class FilterEvent extends BaseEvent {
  String? filterText;
  FilterEvent(this.filterText);
}
