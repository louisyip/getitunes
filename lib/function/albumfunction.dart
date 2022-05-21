import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AlbumFunction {
  static void savealbum(int collectionId) async {
    final prefs = await SharedPreferences.getInstance();
    final key = "SavedAlbum";
    List<dynamic> bookmarkcollectionIdList =
        json.decode(prefs.getString(key) ?? "[]");
    if (bookmarkcollectionIdList.contains(collectionId)) {
      bookmarkcollectionIdList.remove(collectionId);
    } else {
      bookmarkcollectionIdList.add(collectionId);
    }
    String bookmarkcollectionIdListString =
        json.encode(bookmarkcollectionIdList);
    prefs.setString(key, bookmarkcollectionIdListString);
  }
}
