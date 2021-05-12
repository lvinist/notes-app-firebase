class Quote {
  final String quoteText;
  final String quoteAuthor;
  Quote({required this.quoteAuthor, required this.quoteText});

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
        quoteAuthor: json['quote']['body'], quoteText: json['quote']['author']);
  }
}
