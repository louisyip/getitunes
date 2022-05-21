import 'callMethod.dart';
import 'package:http/http.dart';
import 'dart:convert';
import '../model/albumResult.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static void getAlbumList(
      void onSuccess(Response response, List<AlbumResult> albumList),
      void onFailed(Response response)) async {
    final prefs = await SharedPreferences.getInstance();
    final key = "SavedAlbum";
    List<dynamic> bookmarkcollectionIdList =
        json.decode(prefs.getString(key) ?? "[]");
    MethodService.getMethod(
        "https://itunes.apple.com/search?term=jack+johnson&entity=album",
        (Response response) {
      final responseJson = json.decode(response.body);
      if (response.statusCode == 200) {
        List<AlbumResult> albumList = List<AlbumResult>();
        List dataList = responseJson['results'];

        for (int i = 0; i < dataList.length; i++) {
          albumList.add(AlbumResult(
              wrapperType: dataList[i]['wrapperType'],
              collectionType: dataList[i]['collectionType'],
              artistId: dataList[i]['artistId'],
              collectionId: dataList[i]['collectionId'],
              amgArtistId: dataList[i]['amgArtistId'],
              artistName: dataList[i]['artistName'],
              collectionName: dataList[i]['collectionName'],
              collectionCensoredName: dataList[i]['collectionCensoredName'],
              artistViewUrl: dataList[i]['artistViewUrl'],
              collectionViewUrl: dataList[i]['collectionViewUrl'],
              artworkUrl60: dataList[i]['artworkUrl60'],
              artworkUrl100: dataList[i]['artworkUrl100'],
              collectionPrice: dataList[i]['collectionPrice'],
              collectionExplicitness: dataList[i]['collectionExplicitness'],
              trackCount: dataList[i]['trackCount'],
              copyright: dataList[i]['copyright'],
              country: dataList[i]['country'],
              currency: dataList[i]['currency'],
              releaseDate: dataList[i]['releaseDate'],
              primaryGenreName: dataList[i]['primaryGenreName'],
              bookmarked: bookmarkcollectionIdList
                  .contains(dataList[i]['collectionId'])));
        }
        onSuccess(response, albumList);
      } else {
        onFailed(response);
      }
    }, (Error error) {
      print("Network error");
      onFailed(null);
    });
  }

  static void getSavedList(
      void onSuccess(Response response, List<AlbumResult> albumList),
      void onFailed(Response response)) async {
    final prefs = await SharedPreferences.getInstance();
    final key = "SavedAlbum";
    List<dynamic> bookmarkcollectionIdList =
        json.decode(prefs.getString(key) ?? "[]");
    MethodService.getMethod(
        "https://itunes.apple.com/search?term=jack+johnson&entity=album",
        (Response response) {
      final responseJson = json.decode(response.body);
      if (response.statusCode == 200) {
        List<AlbumResult> albumList = List<AlbumResult>();
        List dataList = responseJson['results'];

        for (int i = 0; i < dataList.length; i++) {
          if (bookmarkcollectionIdList.contains(dataList[i]['collectionId'])) {
            albumList.add(AlbumResult(
                wrapperType: dataList[i]['wrapperType'],
                collectionType: dataList[i]['collectionType'],
                artistId: dataList[i]['artistId'],
                collectionId: dataList[i]['collectionId'],
                amgArtistId: dataList[i]['amgArtistId'],
                artistName: dataList[i]['artistName'],
                collectionName: dataList[i]['collectionName'],
                collectionCensoredName: dataList[i]['collectionCensoredName'],
                artistViewUrl: dataList[i]['artistViewUrl'],
                collectionViewUrl: dataList[i]['collectionViewUrl'],
                artworkUrl60: dataList[i]['artworkUrl60'],
                artworkUrl100: dataList[i]['artworkUrl100'],
                collectionPrice: dataList[i]['collectionPrice'],
                collectionExplicitness: dataList[i]['collectionExplicitness'],
                trackCount: dataList[i]['trackCount'],
                copyright: dataList[i]['copyright'],
                country: dataList[i]['country'],
                currency: dataList[i]['currency'],
                releaseDate: dataList[i]['releaseDate'],
                primaryGenreName: dataList[i]['primaryGenreName'],
                bookmarked: true));
          }
        }
        onSuccess(response, albumList);
      } else {
        onFailed(response);
      }
    }, (Error error) {
      print("Network error");
      onFailed(null);
    });
  }
}
