import 'package:flutter/material.dart';
import 'package:favorite_button/favorite_button.dart';
import 'model/albumResult.dart';
import 'function/albumfunction.dart';

class AlbumCard extends StatefulWidget {
  final AlbumResult albumResult;

  AlbumCard({Key key, this.albumResult}) : super(key: key);

  @override
  _AlbumCardState createState() => _AlbumCardState();
}

class _AlbumCardState extends State<AlbumCard> {
  String priceString = "";

  @override
  void initState() {
    //getServerImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 120.0,
      child: Row(
        children: <Widget>[
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    width: MediaQuery.of(context).size.width - 110,
                    child: Text(widget.albumResult.artistName +
                        '\n' +
                        widget.albumResult.collectionCensoredName)),
                Visibility(
                    visible: widget.albumResult.collectionPrice != null
                        ? true
                        : false,
                    child: Container(
                        padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                        width: MediaQuery.of(context).size.width - 110,
                        child: Text(widget.albumResult.currency +
                            "\$" +
                            widget.albumResult.collectionPrice.toString()))),
                Container(
                  child: FavoriteButton(
                    isFavorite: widget.albumResult.bookmarked,
                    valueChanged: (_isFavourite) {
                      AlbumFunction.savealbum(widget.albumResult.collectionId);
                    },
                  ),
                )
              ]),
          FadeInImage.assetNetwork(
            width: 100,
            fit: BoxFit.fitWidth,
            placeholder: 'assets/images/loading.gif',
            image: widget.albumResult.artworkUrl60,
          )
        ],
      ),
    );
  }
}
