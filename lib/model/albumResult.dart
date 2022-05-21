class AlbumResult {
  String wrapperType;
  String collectionType;
  int artistId;
  int collectionId;
  int amgArtistId;
  String artistName;
  String collectionName;
  String collectionCensoredName;
  String artistViewUrl;
  String collectionViewUrl;
  String artworkUrl60;
  String artworkUrl100;
  double collectionPrice;
  String collectionExplicitness;
  int trackCount;
  String copyright;
  String country;
  String currency;
  String releaseDate;
  String primaryGenreName;
  bool bookmarked;
  AlbumResult(
      {this.wrapperType,
      this.collectionType,
      this.artistId,
      this.collectionId,
      this.amgArtistId,
      this.artistName,
      this.collectionName,
      this.collectionCensoredName,
      this.artistViewUrl,
      this.collectionViewUrl,
      this.artworkUrl60,
      this.artworkUrl100,
      this.collectionPrice,
      this.collectionExplicitness,
      this.trackCount,
      this.copyright,
      this.country,
      this.currency,
      this.releaseDate,
      this.primaryGenreName,
      this.bookmarked});

  AlbumResult copy() {
    return AlbumResult(
        wrapperType: this.wrapperType,
        collectionType: this.collectionType,
        artistId: this.artistId,
        collectionId: this.collectionId,
        amgArtistId: this.amgArtistId,
        artistName: this.artistName,
        collectionName: this.collectionName,
        collectionCensoredName: this.collectionCensoredName,
        artistViewUrl: this.artistViewUrl,
        collectionViewUrl: this.collectionViewUrl,
        artworkUrl60: this.artworkUrl60,
        artworkUrl100: this.artworkUrl100,
        collectionPrice: this.collectionPrice,
        collectionExplicitness: this.collectionExplicitness,
        trackCount: this.trackCount,
        copyright: this.copyright,
        country: this.country,
        currency: this.currency,
        releaseDate: this.releaseDate,
        primaryGenreName: this.primaryGenreName,
        bookmarked: this.bookmarked);
  }
}
