class Quote {
  final String quoteText;
  final String quoteAuthor;
  Quote({this.quoteAuthor, this.quoteText});

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
        quoteText: json['quote']['body'], quoteAuthor: json['quote']['author']);
  }
}
