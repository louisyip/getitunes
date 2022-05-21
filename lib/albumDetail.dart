import 'package:flutter/material.dart';
import 'style/color.dart';
import 'model/albumResult.dart';

class AlbumDetailPage extends StatefulWidget {
  final AlbumResult albumResult;
  final int rowid;
  AlbumDetailPage({Key key, this.albumResult, this.rowid}) : super(key: key);

  @override
  _AlbumDetailPageState createState() => _AlbumDetailPageState();
}

class _AlbumDetailPageState extends State<AlbumDetailPage> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: 'hero-page-child' + widget.rowid.toString(),
        child: Scaffold(
            appBar: new AppBar(
              iconTheme: IconThemeData(color: Colors.white),
              title: const Text('album', style: TextStyle(color: Colors.white)),
              backgroundColor: Colors.lightBlue[300],
            ),
            body: Center(
              child: Container(
                height: double.infinity,
                /*
        decoration: BoxDecoration(
          image: DecorationImage(
            image: new NetworkImage('http:jccpaweb.vizzhost.com/images/photos/'+widget.coupon.imageLink),
            fit: BoxFit.cover,
          ),
        ),
        */
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(100, 0, 100, 0),
                        child: FadeInImage.assetNetwork(
                          placeholder: 'assets/images/loading.gif',
                          image: widget.albumResult.artworkUrl100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: APPColor.lightPink,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("artistName : ",
                                style: APPColor.albumDetailTextStyle),
                            Text(widget.albumResult.artistName,
                                style: APPColor.albumDetailTextStyle),
                            Text("collectionName : ",
                                style: APPColor.albumDetailTextStyle),
                            Text(widget.albumResult.collectionName,
                                style: APPColor.albumDetailTextStyle),
                            Text("artistName : ",
                                style: APPColor.albumDetailTextStyle),
                            Text(
                                "\ncopyright : " + widget.albumResult.copyright,
                                style: APPColor.albumDetailTextStyle),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }
}
