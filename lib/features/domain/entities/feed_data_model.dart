class FeedDataModel {
  int? index;
  String? title;
  String? description;
  String? imagePath;
  int? likesCount;
  bool? thumbsUp;

  FeedDataModel(
      {this.description="",
      this.imagePath="",
      this.index=-1,
      this.likesCount=0,
      this.thumbsUp=false,
      this.title=""});
}
