class FavoriteBody {
  String mediaType;
  int mediaId;
  bool favorite;

  FavoriteBody({
    required this.mediaType,
    required this.mediaId,
    required this.favorite,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};

    map["media_type"] = mediaType;
    map["media_id"] = mediaId;
    map["favorite"] = favorite;

    return map;
  }
}
