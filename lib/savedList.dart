import 'package:flutter/material.dart';
import 'api/apiList.dart';
import 'model/albumResult.dart';
import 'package:animations/animations.dart';
import 'package:auto_animated/auto_animated.dart';
import 'albumCard.dart';
import 'albumDetail.dart';

class SavedListPage extends StatefulWidget {
  SavedListPage({Key key}) : super(key: key);

  @override
  _SavedListPageState createState() => _SavedListPageState();
}

class _SavedListPageState extends State<SavedListPage> {
  List<AlbumResult> albumListData = [];

  void getAlbumList() {
    ApiService.getSavedList((response, albumList) {
      this.setState(() {
        albumListData = albumList;
      });
    }, (response) {});
  }

  @override
  void initState() {
    super.initState();
    getAlbumList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LiveList(
        showItemInterval: Duration(milliseconds: 150),
        showItemDuration: Duration(milliseconds: 350),
        reAnimateOnVisibility: true,
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        itemCount: albumListData == null ? 0 : albumListData.length,
        itemBuilder: animationItemBuilder((index) => OpenContainer(
              openColor: Colors.yellow,
              closedElevation: 10.0,
              openElevation: 15.0,
              transitionType: ContainerTransitionType.fade,
              transitionDuration: const Duration(milliseconds: 100),
              openBuilder: (context, action) {
                return AlbumDetailPage(
                  albumResult: albumListData[index],
                  rowid: index,
                );
              },
              closedBuilder: (context, action) {
                return Card(
                  child: AlbumCard(
                    albumResult: albumListData[index],
                  ),
                );
              },
            )),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

Widget Function(
  BuildContext context,
  int index,
  Animation<double> animation,
) animationItemBuilder(
  Widget Function(int index) child, {
  EdgeInsets padding = EdgeInsets.zero,
}) =>
    (
      BuildContext context,
      int index,
      Animation<double> animation,
    ) =>
        FadeTransition(
          opacity: Tween<double>(
            begin: 0,
            end: 1,
          ).animate(animation),
          child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset(0, -0.1),
              end: Offset.zero,
            ).animate(animation),
            child: Padding(
              padding: padding,
              child: child(index),
            ),
          ),
        );
