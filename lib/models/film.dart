class Film {
  String title, openingCrawl, director, producer;
  DateTime releaseDate;

  Film({
    this.title,
    this.openingCrawl,
    this.director,
    this.producer,
    this.releaseDate,
  });

  Film.fromMap(Map<String, dynamic> map) {
    title = map['title'];
    openingCrawl = map['opening_crawl'];
    director = map['director'];
    producer = map['producer'];
    releaseDate = DateTime.parse(map['release_date']);
  }
}